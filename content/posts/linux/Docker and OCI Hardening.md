---
title: "Docker and OCI Hardening"
date: 2022-03-30T21:23:12Z
tags: ['Applications', 'Linux', 'Containers', 'Security']
author: Wonderfall
canonicalURL: https://wonderfall.dev/docker-hardening/
ShowCanonicalLink: true
---

Containers aren't that new fancy thing anymore, but they were a big deal. And they still are. They are a concrete solution to the following problem:

> \- Hey, your software doesn't work...
>
> \- Sorry, it works on my computer! Can't help you.

Whether we like them or not, containers are here to stay. Their expressiveness and semantics allow for an abstraction of the OS dependencies that a software has, the latter being often dynamically linked against certain libraries. The developer can therefore provide a known-good environment where it is expected that their software "just works". That is particularly useful for development to eliminate environment-related issues, and that is often used in production as well.

Containers are often perceived as a great tool for isolation, that is, they can provide an isolated workspace that won't pollute your host OS - all that without the overhead of virtual machines. Security-wise: containers, as we know them on Linux, are glorified namespaces at their core. Containers usually share the same kernel with the host, and **namespaces** is the kernel feature for separating kernel resources across containers (IDs, networks, filesystems, IPC, etc.). Containers also leverage the features of **cgroups** to separate system resources (CPU, memory, etc.), and security features such as seccomp to restrict syscalls, or MACs (AppArmor, SELinux).

At first, it seems that containers may not provide the same isolation boundary as virtual machines. That's fine, they were not designed to. But they can't be simplified to a simple `chroot` either. We'll see that a "container" can mean a lot of things, and their definition may vary a lot depending on the implementation: as such, containers are mostly defined by their semantics.

## Docker is dead, long live Docker... and OCI!
When people think of containers, a large group of them may think of Docker. While Docker played a big role in the popularity of containers a few years ago, it didn't introduce the technology: on Linux, LXC did (*Linux Containers*). In fact, Docker in its early days was a high-level wrapper for LXC which already combined the power of namespaces and cgroups. Docker then replaced LXC with `libcontainer` which does more or less the same, plus extra features.

Then, what happened? *Open Container Initiative* (OCI). That is the current standard that defines the container ecosystem. That means that whether you're using Docker, Podman, or Kubernetes, you're in fact running OCI-compliant tools. That is a good thing, as it saves a lot of interoperability headaches.

**Docker** is no longer the monolithic platform it once was. `libcontainer` was absorbed by `runc`, the reference OCI runtime. The high-level components of Docker split into different parts related to the upstream Moby project (Docker is the "assembled product" of the "Moby components"). When we refer to Docker, we refer in fact at this powerful high-level API that manages OCI containers. By design, Docker is a daemon that communicates with `containerd`, a lower-level layer, which in turn communicates with the OCI runtime. That also means that you could very well skip Docker altogether and use `containerd` or even `runc` directly.

```
Docker client <=> Docker daemon <=> containerd <=> containerd-shim <=> runc
```

**Podman** is an alternative to Docker developed by RedHat, that also intends to be a drop-in replacement for Docker. It doesn't work with a daemon, and can work rootless by design (Docker has support for rootless too, but that is not without caveats). I would largely recommend Podman over Docker for someone who wants a simple tool to run containers and test code on their machine.

**Kubernetes** (also known as K8S) is the container platform made by Google. It is designed with scaling in mind, and is about running containers across a cluster whereas Docker focuses on packaging containers on a single node. Docker Swarm is the direct alternative to that, but it has never really took off due to the popularity of K8S.

For the rest of this article, we will use Docker as the reference for our examples, along with the [Compose specification](https://docs.docker.com/compose/compose-file/) format. Most of these examples can be adapted to other platforms without issues.

## The nightmare of dependencies
Containers are made from images, and images are typically built from a Dockerfile. Images can be built and distributed through OCI registries: [Docker Hub](https://hub.docker.com/), [Google Container Registry](https://cloud.google.com/container-registry), [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry), and so on. You can also set up your own private registry as well, but the reality is that people often pull images from these public registries.

### Images, immutability and versioning
Images are what make containers, well, containers. Containers made from the same image should behave similarly on different machines. Images can have **tags**, which are useful for software versioning. The usage of generic tags such as `latest` is often discouraged because it defeats the purpose of the expected behavior of the container. Tags are not necessarily immutable by design, and they shouldn't be (more on that below). **Digest**, however, is the attribute of an immutable image, and is often generated with the SHA-256 algorithm.

```
docker.io/library/golang:1.17.1@sha256:232a180dbcbcfa7250917507f3827d88a9ae89bb1cdd8fe3ac4db7b764ebb25
         ^          ^       ^                                   ^ 
         |          |       |                                   |
     Registry     Image    Tag                          Digest (immutable)
```

Now onto why tags shouldn't be immutable: as written above, containers bring us an abstraction over the OS dependencies that are used by the packaged software. That is nice indeed, but this shouldn't lure us into believing that we can forget security updates. The fact is, **there is still a whole OS to care about**, and we can't just think of the container as a simple package tool for software.

For these reasons, good practices were established:
- An image should be as minimal as possible (Alpine Linux, or scratch/distroless).
- An image, with a given tag, should be regularly built, without cache to ensure all layers are freshly built.
- An image should be rebuilt when the images it's based on are updated.

### A minimal base system
[Alpine Linux](https://alpinelinux.org/) is often the choice for official images for the first reason. This is not a typical Linux distribution as it uses musl as its C library, but it works quite well. Actually, I'm quite fond of Alpine Linux and `apk` (its package manager). If a supervision suite is needed, I'd look into `s6`. If you need a glibc distribution, Debian provides slim variants for lightweight base images. We can do even better than using Alpine by using **distroless images**, allowing us to have state-of-the-art application containers.

"Distroless" is a fancy name referring to an image with a minimal set of dependencies, from none (for fully static binaries) to some common libraries (typically the C library). Google maintains [distroless images](https://github.com/GoogleContainerTools/distroless) you can use as a base for your own images. If you were wondering, the difference with `scratch` (empty starting point) is that distroless images contain common dependencies that "almost-statically compiled" binaries may need, such as `ca-certificates`.

However, distroless images are not suited for every application. In my experience though, distroless is an excellent option with pure Go binaries. Going with minimal images drastically reduces the available attack surface in the container. For example, here's a [multi-stage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/) resulting in a minimal non-root image for a simple Go project:

```Dockerfile
FROM golang:alpine as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go mod -o /my_app cmd/my_app

FROM gcr.io/distroless/static
COPY --from=build /my_app /
USER nobody
ENTRYPOINT ["/my_app"]
```

The main drawback of using minimal images is the lack of tools that help with debugging, which also constitute the very attack surface we're trying to get rid of. The trade-off is probably not worth the hassle for development-focused containers, and if you're running such images in production, you have to be confident enough to operate with them. Note that the `gcr.io/distroless` images have a `:debug` tag to help in that regard.

### Keeping images up-to-date
The two other points are highly problematic, because most software vendors just publish an image on release, and forget about it. You should take it up to them if you're running images that are versioned but not regularly updated. I'd say running scheduled builds **once a week** is the bare minimum to make sure dependencies stay up-to-date. Alpine Linux is a better choice than most other "stable" distributions because it usually has more recent packages.

Stable distributions often rely on backporting security fixes from CVEs, which is known to be a flawed approach to security since CVEs aren't always assigned or even taken care of. Alpine has more recent packages, and it has versioning, so it's once again a particularly good choice as long as `musl` doesn't cause issues.

### Is it really a security nightmare?
When people say Docker is a security nightmare because of that, that's a fair point. On a traditional system, you could upgrade your whole system with a single command or two. With Docker, you'll have to recreate several containers... if the images were kept up-to-date in the first place. Recreating itself is not a big deal actually: hot upgrades of binaries and libraries often require the services that use them to restart, otherwise they could still use an old (and vulnerable) version of them in memory. But yeah, the fact is most people are running outdated containers, and more often than not, they don't have the choice if they rely on third-party images.

[Trivy](https://github.com/aquasecurity/trivy) is an excellent tool to scan images for a subset of **known vulnerabilities** an image might have. You should play with it and see for yourself how outdated many publicly available images are.

### Supply-chain attacks
As with any code downloaded from a software vendor, OCI images are not exempt from supply-chain attacks. The good practice is quite simple: rely on official images, and ideally build and maintain your own images. One should definitely not automatically trust random third-party images they can find on Docker Hub. Half of these images, if not more, contain vulnerabilities, and I bet a good portion of them contains malwares [such as miners](https://www.trendmicro.com/vinfo/fr/security/news/virtualization-and-cloud/malicious-docker-hub-container-images-cryptocurrency-mining) or worse.

As an image maintainer, you can sign your images to improve the authenticity assurance. Most official images make use of [Docker Content Trust](https://docs.docker.com/engine/security/trust/), which works with a OCI registry attached to a [Notary server](https://github.com/notaryproject/notary). With the Docker toolset, setting the environment variable `DOCKER_CONTENT_TRUST=1` enforces signature verification (a signature is only good if it's checked in the first place). The SigStore initiative is developing [cosign](https://github.com/sigstore/cosign), an alternative that doesn't require a Notary server because it works with features already provided by the registry such as tags. Kubernetes users may be interested in [Connaisseur](https://github.com/sse-secure-systems/connaisseur) to ensure all signatures have been validated.

## Leave my root alone!

### Attack surface
Traditionally, Docker runs as a daemon owned by root. That also means that root in the container is actually the root on the host and may be a few commands away from compromising the host. More generally, the attacker has to exploit the available attack surface to escape the container. There is a huge attack surface, actually: the Linux kernel. [Someone wise once said](https://grsecurity.net/huawei_hksp_introduces_trivially_exploitable_vulnerability):

> The kernel can effectively be thought of as the largest, most vulnerable setuid root binary on the system.

That applies particularly to traditional containers which weren't designed to provide a robust level of isolation. A recent example was [CVE-2022-0492](https://unit42.paloaltonetworks.com/cve-2022-0492-cgroups/): the attacker could abuse root in the container to exploit cgroups v1, and compromise the host. Of course defense-in-depth measures would have prevented that, and we'll mention them. But fundamentally, container escapes are possible by design.

Breaking out via the OCI runtime `runc` is also possible, although [CVE-2019-5736](https://unit42.paloaltonetworks.com/breaking-docker-via-runc-explaining-cve-2019-5736/) was a particularly nasty bug. The attacker had to gain access to root in the container first in order to access `/proc/[runc-pid]/exe`, which indicates them where to overwrite the `runc` binary.

Good practices have been therefore established:
- Avoid using root in the container, plain and simple.
- Keep the host kernel, Docker and the OCI runtime updated.
- Consider the usage of user namespaces.

By the way, it goes without saying that any user who has access to the Docker daemon should be considered as privileged as root. Mounting the Docker socket (`/var/run/docker.sock`) in a container makes it highly privileged, and so it should be avoided. The socket should only be owned by root, and if that doesn't work with your environment, use Docker rootless or Podman.

### Avoiding root
root can be avoided in different ways in the final container:
- Image creation time: setting the `USER` instruction in the Dockerfile.
- Container creation time: via the tools available (`user:` in the Compose file).
- Container runtime: degrading privileges with entrypoints scripts (`gosu UID:GID`).

Well-made images with security in mind will have a `USER` instruction. In my experience, most people will run images blindly, so it's good harm reduction. Setting the user manually works in some images that aren't designed without root in mind, and it's also great to mitigate some *scenarii* where the image is controlled by an attacker. You also won't have surprises when mounting volumes, so I highly recommend setting the user explicitly and make sure volume permissions are correct once.

Some images allow users to define their own user with UID/GID environment variables, with an entrypoint script that runs as root and takes care of the volume permissions before dropping privileges. While technically fine, it is still attack surface, and it requires the `SETUID`/`SETGID` capabilities to be available in the container.

### User namespaces: sandbox or paradox?
As mentioned just above, [user namespaces](https://www.man7.org/linux/man-pages/man7/user_namespaces.7.html) are a solution to ensure root in the container is not root on the host. Docker supports user namespaces, for instance you could set the default mapping in `/etc/docker/daemon.json`:

```
    "userns-remap": "default"
```

`whoami && sleep 60` in the container will return root, but `ps -fC sleep` on the host will show us the PID of another user. That is nice, but it has limitations and therefore shouldn't be considered as a real sandbox. In fact, the paradox is that [user namespaces are attack surface](https://lists.archlinux.org/pipermail/arch-general/2017-February/043066.html) (and vulnerabilities are still being found [years later](https://www.openwall.com/lists/oss-security/2022/01/29/1)), and it's common wisdom to restrict them to privileged users (`kernel.unprivileged_userns_clone=0`). That is fine for Docker with its traditional root daemon, but Podman expects you to let unprivileged users interact with user namespaces (so essentially privileged code).

Enabling `userns-remap` in Docker shouldn't be a substitute for running unprivileged application containers (where applicable). User namespaces are mostly useful if you intend to run full-fledged OS containers which need root in order to function, but that is out of the scope of the container technologies mentioned in this article; for them, I'd argue exposing such a vulnerable attack surface from the host kernel for dubious sandboxing benefits isn't an interesting trade-off to make.

### The no_new_privs bit
After ensuring root isn't used in your containers, you should look into setting the `no_new_privs` bit. [This Linux feature](https://docs.kernel.org/userspace-api/no_new_privs.html) restricts syscalls such as `execve()` from granting privileges, which is what you want to restrict in-container privilege escalation. This flag can be set for a given container in a Compose file:

```
    security_opt:
        - no-new-privileges: true
```

Gaining privileges in the container will be much harder that way.

### Capabilities
Furthermore, we should mention capabilities: root powers are divided into distinct units by the Linux kernel, called capabilities. Each granted capability also grants privilege and therefore access to a significant amount of attack surface. Security researcher Brad Spengler enumerates [19 important capabilities](https://forums.grsecurity.net/viewtopic.php?f=7&t=2522#p10271). Docker **restricts certain capabilities by default**, but [some of the most important ones](https://github.com/moby/moby/blob/1308a3a99faa13ff279dcb4eb5ad23aee3ab5cdb/oci/caps/defaults.go) are still available to a container by default.

You should consider the following rule of thumb:
- Drop all capabilities by default.
- Allow only the ones you really need to.

If you already run your containers unprivileged without root, your container will very likely work fine with all capabilities dropped. That can be done in a Compose file:

```
    cap_drop:
        - ALL
    #cap_add:
    #  - CHOWN
    #  - DAC_READ_SEARCH
    #  - SETUID
    #  - SETGID
```
Never use the `--privileged` option unless you really need to: a privileged container is given access to almost all capabilities, kernel features and devices.

## Other security features
MACs and seccomp are robust tools that may vastly improve container security.

### Mandatory Access Control
MAC stand for Mandatory Access Control: traditionally a Linux Security Module that will enforce a policy to restrict the userspace. Examples are **AppArmor** and **SELinux**: the former being more easy-to-use, the later being more fine-grained. Both are strong tools that can help... Yet, their sole presence does not mean they're really effective. A robust policy starts from a *deny all* policy, and only allows the necessary resources to be accessed.

### seccomp
seccomp (short for secure computing mode) on the other hand is a much simpler and complementary tool, and there is no reason not to use it. What it does is restricting a process to a set of system calls, thus drastically reducing the attack surface available.

Docker provides default profiles for [AppArmor](https://github.com/moby/moby/tree/85eaf23bf46b12827273ab2ff523c753117dbdc7/profiles/apparmor) and [seccomp](https://github.com/moby/moby/blob/85eaf23bf46b12827273ab2ff523c753117dbdc7/profiles/seccomp/default.json), and they're enabled by default for newly created containers unless the `unconfined` option is explicitly passed. Note: Kubernetes doesn't enable the default seccomp profile by default, so you should probably [try it](https://kubernetes.io/docs/tutorials/security/seccomp/#enable-the-use-of-runtimedefault-as-the-default-seccomp-profile-for-all-workloads).

These profiles are a great start, but you should do much more if you take security seriously, because they were made to not break compatibility with a large range of images. The default seccomp profile only disables [around 44 syscalls](https://docs.docker.com/engine/security/seccomp/#significant-syscalls-blocked-by-the-default-profile), which are mostly not very common and/or obsoleted. Of course, the best profile you can get is supposed to be written for a given program. It also doesn't make sense to insist on the permissiveness of the default profiles, and [a lof of work has gone](https://blog.jessfraz.com/post/containers-security-and-echo-chambers/) into hardening containers.

### cgroups
Use cgroups to restrict access to hardware and system resources. You likely don't want a guest container to monopolize the host resources. You also don't want to be vulnerable to stupid fork bomb attacks. In a Compose file, consider setting these limits:

```
    mem_limit: 4g
    cpus: 4
    pids_limit: 256
```

More runtime options can be found in [the official documentation](https://docs.docker.com/config/containers/resource_constraints/). All of them should have a [Compose spec](https://github.com/compose-spec/compose-spec/blob/master/spec.md) equivalent.

The `--cgroup-parent` option should be avoided as it uses the host cgroup and not the one configured from Docker (or else), which is the default.

### Read-only filesystem
It is good practice to treat the image as some refer to as the "golden image".

In other words, you'll run containers in *read-only* mode, with an immutable filesystem inherited from the image. Only the mounted volumes will be read/write accessible, and those should ideally be mounted with the `noexec`, `nosuid` and `nodev` options for extra security. If read/write access isn't needed, mount these volumes as read-only too.

However, the image may not be perfect and still require read/write access to some parts of the filesystem, likely directories such as `/tmp`, `/run` or `/var`. You can make a **tmpfs** for those (a temporary filesystem in the container attributed memory), because they're not persistent data anyway.

In a Compose file, that would look like the following settings:

```
    read_only: true
    tmpfs:
        - /tmp:size=10M,mode=0770,uid=1000,gid=1000,noexec,nosuid,nodev
```

That is quite verbose indeed, but that's to show you the different options for a tmpfs mount. You want to restrict them in size and permissions ideally.

### Network isolation
By default, all Docker containers will use the default network bridge. They will see and be able to communicate with each other. Each container should have its own user-defined bridge network, and each connection between containers should have an internal network. If you intend to run a reverse proxy in front of several containers, you should make a dedicated network for each container you want to expose to the reverse proxy.

The `--network host` option also shouldn't be used for obvious reasons since the container would share the same network as the host, providing no isolation at all.

## Alternative runtimes (gVisor)
`runc` is the reference OCI runtime, but that means other runtimes can exist as well as long as they're compliant with the OCI standard. These runtimes can be interchanged quite seamlessly. There's a few alternatives, such as [crun](https://github.com/containers/crun) or [youki](https://github.com/containers/youki), respectively implemented in C and Rust (`runc` is a Go implementation). However, there is one particular runtime that does a lot more for security: `runsc`, provided by the [gVisor project](https://gvisor.dev/) by the folks at Google.

**Containers are not a sandbox**, and while we can improve their security, they will fundamentally share a common attack surface with the host. Virtual machines are a solution to that problem, but you might prefer container semantics and ecosystem. gVisor can be perceived as an attempt to get the "best of both worlds": containers that are easy to manage while providing a native isolation boundary. gVisor did just that by implementing two things:

- **Sentry**: an application kernel in Go, a language known to be memory-safe. It implements the Linux logic in userspace such as various system calls.
- **Gofer**: a host process which communicates with Sentry and the host filesystem, since Sentry is restricted in that aspect.

A platform like ptrace or KVM is used to intercept system calls and redirect them from the application to Sentry, which is running in the userspace. This has some costs: there is a higher per-syscall overhead, and compatibility is reduced since not all syscalls are implemented. On top of that, gVisor employs security mechanisms we've glanced over above, such as a [very restrictive seccomp profile](https://github.com/google/gvisor/blob/86ad7d5b5838da1b539e976886d04b93c939ca3d/runsc/boot/filter/config.go) between Sentry and the host kernel, the [no_new_privs bit](https://github.com/google/gvisor/blob/6ef268409620c57197b9d573e23be8cb05dbf381/pkg/sentry/kernel/task_identity.go#L464), and isolated namespaces from the host.

The security model of gVisor is comparable to what you would expect from a virtual machine. It is also very easy to [install and use](https://gvisor.dev/docs/user_guide/install/). The path to runsc along with its different configuration flags (`runsc flags`) should be added to `/etc/docker/daemon.json`:

```json
    "runtimes": {
        "runsc-ptrace": {
            "path": "/usr/local/bin/runsc",
            "runtimeArgs": [
                "--platform=ptrace"
            ]
        },
        "runsc-kvm": {
            "path": "/usr/local/bin/runsc",
            "runtimeArgs": [
                "--platform=kvm"
            ]
        }
    }
```

`runsc` needs to start with root to set up some mitigations, including the use of its own network stack separated from the host. The sandbox itself drops privileges to nobody as soon as possible. You can still use `runsc` rootless if you want (which should be needed for Podman):

```
./runsc --rootless do uname -a
*** Warning: sandbox network isn't supported with --rootless, switching to host ***
Linux 4.4.0 #1 SMP Sun Jan 10 15:06:54 PST 2016 x86_64 GNU/Linux
```

Linux 4.4.0 is shown because that is the version of the Linux API that Sentry tries to mimic. As you've probably guessed, you're not really using Linux 4.4.0, but the application kernel that behaves like it. By the way, gVisor is of course compatible with cgroups.

## Conclusion: what's a container after all?
Like I wrote above, a container is mostly defined by its semantics and ecosystem. Containers shouldn't be solely defined by the OCI reference runtime implementation, as we've seen with gVisor that provides an entirely different security model.

Still not convinced? What if I told you a container can leverage the same technologies as a virtual machine? That is exactly what [Kata Containers](https://katacontainers.io/) does by using a VMM like QEMU-lite to provide containers that are in fact lightweight virtual machines, with their traditional resources and security model, compatibility with container semantics and toolset, and an optimized overhead. While not in the OCI ecosystem, Amazon achieves quite the same with [Firecracker](https://firecracker-microvm.github.io/).

If you're running untrusted workloads, I highly suggest you consider gVisor instead of a traditional container runtime. Your definition of "untrusted" may vary: for me, almost everything should be considered untrusted. That is how modern security works, and how mobile operating systems work. It's quite simple, security should be simple, and gVisor simply offers native security.

Containers are a popular, yet strange world. They revolutionized the way we make and deploy software, but one should not loose the sight of what they really are and aren't. This hardening guide is non-exhaustive, but I hope it can make you aware of some aspects you've never thought of.