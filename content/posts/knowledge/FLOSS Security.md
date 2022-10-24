---
title: "FLOSS Security"
date: "2022-02-02T23:16:00+00:00"
tags: ['Knowledge Base', 'Privacy', 'Security']
author: Rohan Kumar
canonicalURL: https://seirdy.one/posts/2022/02/02/floss-security/
ShowCanonicalLink: true
---

While source code is critical for user autonomy, it isn't required to evaluate software security or understand run-time behavior.

One of the biggest parts of the Free and Open Source Software definitions is the freedom to study a program and modify it; in other words, access to editable source code. I agree that such access is essential; however, far too many people support source availability for the _wrong_ reasons. One such reason is that source code is necessary to have any degree of transparency into how a piece of software operates, and is therefore necessary to determine if it is at all secure or trustworthy. Although security through obscurity is certainly not a robust measure, this claim has two issues:

- Source code describes what a program is designed to do; it is unnecessary and insufficient to determine if what it actually does aligns with its intended design.
- Vulnerability discovery doesn't require source code.

I'd like to expand on these issues, focusing primarily on compiled binaries. Bear in mind that I do not think that source availability is _useless_ from a security perspective (it certainly makes audits easier), and I _do_ think that source availability is required for user freedom. I'm arguing only that **source unavailability doesn't imply insecurity**, and **source availability doesn't imply security**. It's possible (and often preferable) to perform security analysis on binaries, without necessarily having source code. In fact, vulnerability discovery doesn't typically rely upon source code analysis.

I'll update this post occasionally as I learn more on the subject. If you like it, check back in a month or two to see if it has something new.

_PS: this stance is not absolute; I concede to several [good counter-arguments in a dedicated section](#good-counter-arguments)!_

## How security fixes work

I don't think anyone seriously claims that software's security instantly improves the second its source code is published. The argument I'm responding to is that source code is necessary to understand what a program does and how (in)secure it is, and without it we can't know for sure.

Assuming a re-write that fundamentally changes a program's architecture is not an option[^1], software security typically improves by fixing vulnerabilities via something resembling this process:

1. Someone discovers a vulnerability
2. Developers are informed of the vulnerability
3. Developers reproduce the issue and understand what caused it
4. Developers patch the software to fix the vulnerability

Source code is typically helpful (sometimes essential) to Step 3. If someone has completed Step 3, they will require source code to proceed to Step 4. Source code _isn't necessary for Steps 1 and 2_; these steps rely upon understanding how a program misbehaves. For that, we use _reverse engineering_ and/or _fuzzing_.

## Reverse engineering

Understanding _how a program is designed_ is not the same as understanding _what a program does._ A reasonable level of one type of understanding does not imply the other.

Source code[^2] is essential to describe a program's high-level, human-comprehensible design; it represents a contract that outlines how a developer _expects_ a program to behave. A compiler or interpreter[^3] must then translate it into machine instructions. But source code isn't always easy to map directly to machine instructions because it is part of a complex system:

- Compilers (sometimes even interpreters) can apply optimizations and hardening measures that are difficult to reason about. This is especially true for Just-In-Time compilers that leverage run-time information.

- The operating system itself may be poorly understood by the developers, and run a program in a way that contradicts a developer's expectations.

- Toolchains, interpreters, and operating systems can have bugs that impact program execution.

- Different compilers and compiler flags can offer different security guarantees and mitigations.

- Source code can be deceptive by featuring sneaky obfuscation techniques, sometimes unintentionally. Confusing naming patterns, re-definitions, and vulnerabilities masquerading as innocent bugs have all been well-documented: look up "hypocrite commits" or the [Underhanded C Contest](https://en.wikipedia.org/wiki/Underhanded_C_Contest) for examples.

- All of the above points apply to each dependency and the underlying operating system, which can impact a program's behavior.

Furthermore, all programmers are flawed mortals who don't always fully understand source code. Everyone who's done a non-trivial amount of programming is familiar with the feeling of encountering a bug during run-time for which the cause is impossible to find...until they notice it staring them in the face on Line 12. Think of all the bugs that _aren't_ so easily noticed.

Reading the source code, compiling, and passing tests isn't sufficient to show us a program's final behavior. The only way to know what a program does when you run it is to...run it.[^4]

### Special builds

Almost all programmers are fully aware of their limited ability, which is why most already employ techniques to analyze run-time behavior that don't depend on source code. For example, developers of several compiled languages[^5] can build binaries with sanitizers to detect undefined behavior, races, uninitialized reads, etc. that human eyes may have missed when reading source code. While source code is necessary to _build_ these binaries, it isn't necessary to run them and observe failures.

Distributing binaries with sanitizers and debug information to testers is a valid way to collect data about a program's potential security issues.

### Dynamic analysis

It's hard to figure out which syscalls and files a large program program needs by reading its source, especially when certain libraries (e.g. the libc implementation/version) can vary. A syscall tracer like [`strace(1)`](https://strace.io/)[^6] makes the process trivial.

A personal example: the understanding I gained from `strace` was necessary for me to write [my bubblewrap scripts](https://sr.ht/~seirdy/bwrap-scripts/). These scripts use [`bubblewrap(1)`](https://github.com/containers/bubblewrap) to sandbox programs with the minimum permissions possible. Analyzing every relevant program and library's source code would have taken me months, while `strace` gave me everything I needed to know in an afternoon: analyzing the `strace` output told me exactly which syscalls to allow and which files to grant access to, without even having to know what language the program was written in. I generated the initial version of the syscall allow-lists with the following command[^7]:

```
strace name-of-program program-args 2>&1 \
	| rg '^([a-z_]*)\(.*' --replace '$1' \
	| sort | uniq
```

This also extends to determining how programs utilize the network: packet sniffers like [Wireshark](https://www.wireshark.org/) can determine when a program connects to the network, and where it connects.

These methods are not flawless. Syscall tracers are only designed to shed light on how a program interacts with the kernel. Kernel interactions tell us plenty (it's sometimes all we need), but they don't give the whole story. Furthermore, packet inspection can be made a bit painful by transit encryption[^8]; tracing a program's execution alongside packet inspection can offer clarity, but this is not easy.

For more information, we turn to [**core dumps**](https://en.wikipedia.org/wiki/Core_dump), also known as memory dumps. Core dumps share the state of a program during execution or upon crashing, giving us greater visibility into exactly what data a program is processing. Builds containing debugging symbols (e.g. [DWARF](https://dwarfstd.org/)) have more detailed core dumps. Vendors that release daily snapshots of pre-release builds typically include some symbols to give testers more detail concerning the causes of crashes. Web browsers are a common example: Chromium dev snapshots, Chrome Canary, Firefox Nightly, WebKit Canary builds, etc. all include debug symbols. [Until 2019](https://twitter.com/MisteFr/status/1168597562703716354?s=20), _Minecraft: Bedrock Edition_ included debug symbols which were used heavily by the modding community.[^9]

#### Dynamic analysis example: Zoom

In 2020, Zoom Video Communications came under scrutiny for marketing its "Zoom" software as a secure, end-to-end encrypted solution for video conferencing. Zoom's documentation claimed that it used "AES-256" encryption. Without source code, did we have to take the docs at their word?

[The Citizen Lab](https://citizenlab.ca/) didn't. On 2020-04-03, it published [a report](https://citizenlab.ca/2020/04/move-fast-roll-your-own-crypto-a-quick-look-at-the-confidentiality-of-zoom-meetings/) revealing critical flaws in Zoom's encryption. It utilized Wireshark and [mitmproxy](https://mitmproxy.org/) to analyze networking activity, and inspected core dumps to learn about its encryption implementation. The Citizen Lab's researchers found that Zoom actually used an incredibly flawed implementation of a weak version of AES-128 (ECB mode), and easily bypassed it.

Syscall tracing, packet sniffing, and core dumps are great, but they rely on manual execution which might not hit all the desired code paths. Fortunately, there are other forms of analysis available.

### Binary analysis

Tracing execution and inspecting memory dumps can be considered forms of reverse engineering, but they only offer a surface-level view of what's going on. Reverse engineering gets much more interesting when we analyze a binary artifact.

Static binary analysis is a powerful way to inspect a program's underlying design. Decompilation (especially when supplemented with debug symbols) can re-construct a binary's assembly or source code. Symbol names may look incomprehensible in stripped binaries, and comments will be missing. What's left is more than enough to decipher control flow to uncover how a program processes data. This process can be tedious, especially if a program uses certain forms of binary obfuscation.

The goal doesn't have to be a complete understanding of a program's design (incredibly difficult without source code); it's typically to answer a specific question, fill in a gap left by tracing/fuzzing, or find a well-known property. When developers publish documentation on the security architecture of their closed-source software, reverse engineering tools like decompilers are exactly what you need to verify their honesty (or lack thereof).

Decompilers are seldom used alone in this context. Instead, they're typically a component of reverse engineering frameworks that also sport memory analysis, debugging tools, scripting, and sometimes even IDEs. I use [the Rizin framework](https://rizin.re/), but [Ghidra](https://ghidra-sre.org/) is also popular. Their documentation should help you get started if you're interested.

### Example: malware analysis

These reverse-engineering techniques---a combination of tracing, packet sniffing, binary analysis, and memory dumps---make up the workings of most modern malware analysis. See [this example of a fully-automated analysis of the Zoom Windows installer](https://www.hybrid-analysis.com/sample/1ef3b7e9ba5f486afe53fcbd71f69c3f9a01813f35732222f64c0981a0906429/5e428f69c88e9e64c33afe64). It enumerates plenty of information about Zoom without access to its source code: reading unique machine information, anti-VM and anti-reverse-engineering tricks, reading config files, various types of network access, scanning mounted volumes, and more.

To try this out yourself, use a sandbox designed for dynamic analysis. [Cuckoo](https://github.com/cuckoosandbox) is a common and easy-to-use solution, while [DRAKVUF](https://drakvuf.com/) is more advanced.

### Extreme example: the truth about Intel ME and AMT

The Intel Management Engine (ME) is a mandatory subsystem of all Intel processors (after 2008) with extremely privileged access to the host system. Active Management Technology (AMT) runs atop it on the subset of Intel processors with "vPro" branding. The latter can be disabled and is intended for organizations to remotely manage their inventory (installing software, monitoring, remote power-on/sleep/wake, etc).

The fact that Intel ME has such deep access to the host system and the fact that it's proprietary have both made it the subject of a high degree of scrutiny. Many people (most of whom have little experience in the area) connected these two facts together to allege that the ME is a backdoor, often by confusedly citing functionality of Intel AMT instead of ME. Is it really impossible to know for sure?

I picked Intel ME+AMT to serve as an extreme example: it shows both the power and limitations of the analysis approaches covered. ME isn't made of simple executables you can just run in an OS because it sits far below the OS, in what's sometimes called "Ring -3".[^10] Analysis is limited to external monitoring (e.g. by monitoring network activity) and reverse-engineering unpacked partially-obfuscated firmware updates, with help from official documentation. This is slower and harder than analyzing a typical executable or library.

Answers are a bit complex and…more boring than what sensationalized headlines would say. [Igor Skochinsky](https://twitter.com/igorskochinsky) (the developer of [me-tools](https://github.com/skochinsky/me-tools)) and [Nicola Corna](https://github.com/corna) (the developer of [me_cleaner](https://github.com/corna/me_cleaner)) presented their analysis of ME in [Intel Me: Myths and Reality](https://fahrplan.events.ccc.de/congress/2017/Fahrplan/system/event_attachments/attachments/000/003/391/original/Intel_ME_myths_and_reality.pdf); Vassilios Ververis thoroughly analyzed AMT in [Security Evaluation of Intel's Active Management Technology](https://kth.diva-portal.org/smash/get/diva2:508256/FULLTEXT01). Interestingly, the former pair argues that auditing binary code is preferable to potentially misleading source code: binary analysis allows auditors to “cut the crap” and inspect what software is truly made of. However, this was balanced by a form of binary obfuscation that the pair encountered; I’ll describe it in a moment.

Simply monitoring network activity and systematically testing all claims made by the documentation allowed Ververis to uncover a host of security issues in Intel AMT. However, no undocumented features have (to my knowledge) been uncovered. The problematic findings revolved around flawed/insecure implementations of documented functionality. In other words: there's been no evidence of AMT being "a backdoor", but its security flaws could have had a similar impact. Fortunately, AMT can be disabled. What about ME?

This is where some binary analysis comes in. Neither Skochinsky's [ME Secrets](https://recon.cx/2014/slides/Recon%202014%20Skochinsky.pdf) presentation nor <cite>Intel Me: Myths and Reality</cite> seem to enumerate any contradictions with [official Intel documentation](https://link.springer.com/book/10.1007/978-1-4302-6572-6).

Unfortunately, some components are poorly understood due to being obfuscated using [Huffman compression with unknown dictionaries](http://io.netgarage.org/me/). Understanding the inner workings of the obfuscated components blurs the line between software reverse-engineering and figuring out how the chips are actually made, the latter of which is nigh-impossible if you don't have access to a chip lab full of cash. However, black-box analysis does tell us about the capabilities of these components: see page 21 of "ME Secrets". Thanks to zdctg for clarifying this.

Skochinsky's and Corna's analysis was sufficient to clarify (but not completely contradict) sensationalism claiming that ME can remotely lock any PC (it was a former opt-in feature), can spy on anything the user does (they clarified that access is limited to unblocked parts of the host memory and the integrated GPU, but doesn't include e.g. the framebuffer), etc.

While claims such as "ME is a black box that can do anything" are misleading, ME not without its share of vulnerabilities. My favorite look at its issues is a presentation by [Mark Ermolov](https://www.blackhat.com/eu-17/speakers/Mark-Ermolov.html) and [Maxim Goryachy](https://www.blackhat.com/eu-17/speakers/Maxim-Goryachy.html) at Black Hat Europe 2017: [How to Hack a Turned-Off Computer, or Running Unsigned Code in Intel Management Engine](https://www.blackhat.com/docs/eu-17/materials/eu-17-Goryachy-How-To-Hack-A-Turned-Off-Computer-Or-Running-Unsigned-Code-In-Intel-Management-Engine-wp.pdf).

In short: ME being proprietary doesn't mean that we can't find out how (in)secure it is. Binary analysis when paired with runtime inspection can give us a good understanding of what trade-offs we make by using it. While ME has a history of serious vulnerabilities, they're nowhere near what [borderline conspiracy theories](https://web.archive.org/web/20210302072839/themerkle.com/what-is-the-intel-management-engine-backdoor/) claim.[^11]

(Note: Intel is not alone here. Other chips typically have equivalents, e.g. AMD Secure Technology).

Fuzzing
-------

Manual invocation of a program paired with a tracer like `strace` won't always exercise all code paths or find edge-cases. [Fuzzing helps bridge this gap](https://en.wikipedia.org/wiki/Fuzzing): it automates the process of causing a program to fail by generating random or malformed data to feed it. Researchers then study failures and failure-conditions to isolate a bug.

Fuzzing doesn't necessarily depend on access to source code, as it is a black-box technique. Fuzzers like [American Fuzzy Loop (AFL)](https://lcamtuf.coredump.cx/afl/) normally use [special fuzz-friendly builds](#special-builds), but [other fuzzing setups](https://aflplus.plus/docs/binaryonly_fuzzing/) can work with just about any binaries. In fact, some types of fuzz tests (e.g. [fuzzing a web API](https://github.com/KissPeter/APIFuzzer/)) hardly need any implementation details.

Fuzzing frequently catches bugs that are only apparent by running a program, not by reading source code. Even so, the biggest beneficiaries of fuzzing are open source projects. [cURL](https://github.com/curl/curl-fuzzer), [OpenSSL](https://github.com/openssl/openssl/tree/master/fuzz), web browsers, text rendering libraries (HarfBuzz, FreeType) and toolchains (GCC, Clang, the official Go toolchain, etc.) are some notable examples.

> I've said it before but let me say it again: fuzzing is really the top method to find problems in curl once we've fixed all flaws that the static analyzers we use have pointed out. The primary fuzzing for curl is done by OSS-Fuzz, that tirelessly keeps hammering on the most recent curl code.

- [Daniel Stenberg](https://daniel.haxx.se/) | [A Google grant for libcurl work](https://daniel.haxx.se/blog/2020/09/23/a-google-grant-for-libcurl-work/)

If you want to get started with fuzzing, I recommend checking out [the quick-start guide for American Fuzzy Loop](https://github.com/google/AFL/blob/master/docs/QuickStartGuide.txt). Some languages like Go 1.18 also have fuzzing tools available right in the standard library.

### Example: CVE-2022-0185

A recent example of how fuzzing helps spot a vulnerability in an open-source project is [CVE-<wbr />2022-0185](https://www.openwall.com/lists/oss-security/2022/01/18/7): a Linux 0-day found by the Crusaders of Rust a few weeks ago. It was discovered using the [syzkaller](https://github.com/google/syzkaller) kernel fuzzer. The process was documented on Will's Root:

[CVE-2022-0185 - Winning a $31337 Bounty after Pwning Ubuntu and Escaping Google's KCTF Containers](https://www.willsroot.io/2022/01/cve-2022-0185.html) by [willsroot](https://willsroot.io)

I _highly_ encourage giving it a read; it's the perfect example of fuzzing with sanitizers to find a vulnerability, reproducing the vulnerability (by writing a tiny C program), _then_ diving into the source code to find and fix the cause, and finally reporting the issue (with a patch!). When source isn't available, the vendor would assume responsibility for the "find and fix" steps.

The fact that some of the most-used pieces of FLOSS in existence have been the biggest beneficiaries of source-agnostic approaches to vulnerability analysis should be quite revealing. The source code to these projects has received attention from millions of eyes, yet they _still_ invest in fuzzing infrastructure and vulnerability-hunters prefer analyzing artifacts over inspecting the source.

## Good counter-arguments

I readily concede to several points in favor of source availability from a security perspective:

- Source code can make analysis _easier_ by _supplementing_ source-independent approaches. The lines between the steps I mentioned in the [four-step vulnerability-fixing process](#how-security-fixes-work) are blurry.

- Patching vulnerabilities is important. Source availability makes it possible for the community, package maintainers, or reporters of a vulnerability to patch software. Package maintainers often blur the line between "packager" and "contributor" by helping projects migrate away from abandoned/insecure dependencies. One example that comes to mind is the Python 2 to Python 3 transition for projects like Calibre.[^12] Being able to fix issues independent of upstream support is an important mitigation against [user domestication](https://seirdy.one/posts/2021/01/27/whatsapp-and-the-domestication-of-users/).

- Some developers/vendors don't distribute binaries that make use of modern toolchain-level exploit mitigations (e.g. <abbr title="Position-Independent Executables">PIE</abbr>, <abbr title="ReLocation Read-Only">RELRO</abbr>, stack canaries, automatic variable initialization, [<abbr title="Control-Flow Integrity">CFI</abbr>](https://clang.llvm.org/docs/ControlFlowIntegrity.html), etc.[^13]). In these cases, building software yourself with these mitigations (or delegating it to a distro that enforces them) requires source code availability (or at least some sort of intermediate representation).

- Closed-source software may or may not have builds available that include sanitizers and debug symbols.

- Although fuzzing release binaries is possible, fuzzing is much easier to do when source code is available. Vendors of proprietary software seldom release special fuzz-friendly builds, and filtering out false-positives can be quite tedious without understanding high-level design.

- It is certainly possible to notice a vulnerability in source code. Excluding low-hanging fruit typically caught by static code analysis and peer review, it's not the main way most vulnerabilities are found nowadays (thanks to [X_CLI](https://www.broken-by-design.fr/) for [reminding me about what source analysis does accomplish](https://lemmy.ml/post/167321/comment/117774).

- Software as a Service can be incredibly difficult to analyze, as we typically have little more than the ability to query a server. Servers don't send core dumps, server-side binaries, or trace logs for analysis. Furthermore, it's difficult to verify which software a server is running.[^14] For services that require trusting a server, access to the server-side software is important from both a security and a user-freedom perspective

Most of this post is written with the assumption that binaries are inspectable and traceable. Binary obfuscation and some forms of content protection/<abbr title="Digital Rights Management">DRM</abbr> violate this assumption and actually do make analysis more difficult.

Beyond source code, transparency into the development helps assure users of compliance with good security practices. Viewing VCS history, patch reviews, linter configurations, etc. reveal the standards that code is being held up to, some of which can be related to bug-squashing and security.

[Patience](https://matrix.to/#/@hypokeimenon:tchncs.de) on Matrix also had a great response, which I agree with and adapt below:

Whether or not the source code is available for software does not change how insecure it is. However, there are good security-related incentives to publish source code.

- Doing so improves vulnerability patchability and future architectural improvement by lowering the barrier to contribution. The fixes that follow can be _shared and used by other projects_ across the field, some of which can in turn be used by the vendor. This isn't a zero-sum game; a rising tide lifts all boats.
- It's generally good practice to assume an attacker has full knowledge of a system instead of relying on security through obscurity. Releasing code provides strong assurance that this assumption is being made. It's a way for vendors to put their money where their mouth is.

Both Patience and [Drew Vault](https://drewdevault.com/) argue that given the above points, a project whose goal is maximum security would release code. Strictly speaking, I agree. Good intentions don't imply good results, but they can _supplement_ good results to provide some trust in a project's future.

## Conclusion

I've gone over some examples of how analyzing a software's security properties need not depend on source code, and vulnerability discovery in both FLOSS and in proprietary software uses source-agnostic techniques. Dynamic and static black-box techniques are powerful tools that work well from user-space (Zoom) to kernel-space (Linux) to low-level components like Intel ME+AMT. Source code enables the vulnerability-fixing process but has limited utility for the evaluation/discovery process.

Don't assume software is safer than proprietary alternatives just because its source is visible; come to a conclusion after analyzing both. There are lots of great reasons to switch from macOS or Windows to Linux (it's been my main OS for years), but [security is low on that list](https://madaidans-insecurities.github.io/linux.html).

All other things being mostly equal, FLOSS is obviously _preferable_ from a security perspective; I listed some reasons why in the counter-arguments section. Unfortunately, being helpful is not the same as being necessary. All I argue is that source unavailability does not imply insecurity, and source availability does not imply security. Analysis approaches that don't rely on source are typically the most powerful, and can be applied to both source-available and source-unavailable software. Plenty of proprietary software is more secure than FLOSS alternatives; few would argue that the sandboxing employed by Google Chrome or Microsoft Edge is more vulnerable than Pale Moon or most WebKitGTK-based browsers, for instance.

Releasing source code is just one thing vendors can do to improve audits; other options include releasing test builds with debug symbols/sanitizers, publishing docs describing their architecture, and/or just keeping software small and simple. We should evaluate software security through _study_ rather than source model. Support the right things for the right reasons, and help others make informed choices with accurate information. There are enough good reasons to support software freedom; we don't need to rely on bad ones.


[^1]: Writing an alternative or re-implementation doesn't require access to the original's source code, as is evidenced by a plethora of clean-room re-implementations of existing software written to circumvent the need to comply with license terms.

[^2]: Ideally well-documented, non-obfuscated code.

[^3]: Or a JIT compiler, or a [bunch of clockwork](https://en.wikipedia.org/wiki/Analytical_Engine), or...

[^4]: For completeness, I should add that there is one source-based approach that can verify correctness: formal proofs. Functional programming languages that [support dependent types](https://en.wikipedia.org/wiki/Dependent_type) can be provably correct at the source level. Assuming their self-hosted toolchains have similar guarantees, developers using these languages might have to worry less about bugs they couldn't find in the source code. This can alleviate concerns that their language runtimes can make it hard to reason about low-level behavior. Thanks to [Adrian Cochrane](https://adrian.geek.nz/) for pointing this out.

[^5]: For example: C, C++, Objective-C, Go, Fortran, and others can utilize sanitizers from Clang and/or GCC.

[^6]: This is probably what people in _The Matrix_ were using to see that iconic [digital rain](https://en.wikipedia.org/wiki/Matrix_digital_rain).

[^7]: This command only lists syscall names, but I did eventually follow the example of [sandbox-app-launcher](https://github.com/Whonix/sandbox-app-launcher) by allowing certain syscalls (e.g. ioctl) only when invoked with certain parameters. Also, I used [ripgrep](https://github.com/BurntSushi/ripgrep) because I'm more familiar with <abbr title="Perl-Compatible Regular Expressions">PCRE</abbr>-style capture groups.

[^8]: Decrypting these packets typically involves saving and using key logs, or using endpoints with [known pre-master secrets](https://blog.didierstevens.com/2020/12/14/decrypting-tls-streams-with-wireshark-part-1/).

[^9]: I invite any modders who miss these debug symbols to check out the FLOSS [Minetest](https://www.minetest.net/), perhaps with the [MineClone2](https://content.minetest.net/packages/Wuzzy/mineclone2/) game.

[^10]: See page 127-130 of the Invisible Things Lab's [Quest to the Core slides](https://invisiblethingslab.com/resources/misc09/Quest%20To%20The%20Core%20%28public%29.pdf). Bear in mind that they often refer to AMT running atop ME.

[^11]: As an aside: your security isn't necessarily improved by "disabling" it, since it still runs during the initial boot sequence and does provide some hardening measures of its own (e.g., a <abbr title="Trusted Platform Module">TPM</abbr>).

[^12]: In 2017, Calibre's author actually wanted to stay with Python 2 after its EOL date, and [maintain Python 2 himself](https://bugs.launchpad.net/calibre/+bug/1714107). Users and package maintainers were quite unhappy with this, as Python 2 would no longer be receiving security fixes after 2020. While official releases of Calibre use a bundled Python interpreter, distro packages typically use the system Python package; Calibre's popularity and insistence on using Python 2 made it a roadblock to getting rid of the Python 2 package in most distros. What eventually happened was that community members (especially [Eli Schwartz](https://github.com/eli-schwartz) and [Flaviu Tamas](https://flaviutamas.com/) submitted patches to migrate Calibre away from Python 2. Calibre migrated to Python 3 by [version 5.0](https://calibre-ebook.com/new-in/fourteen).

[^13]: Linux distributions' CFI+<abbr title="Adress-Space Layout Randomization">ASLR</abbr> implementations rely executables compiled with CFI+PIE support, and ideally with stack-smashing protectors and no-execute bits. These implementations are flawed (see [On the Effectiveness of Full-ASLR on 64-bit Linux](https://web.archive.org/web/20211021222659/http://cybersecurity.upv.es/attacks/offset2lib/offset2lib-paper.pdf) and [Brad Spengler's presentation comparing these with PaX's own implementation](https://grsecurity.net/PaX-presentation.pdf)).

[^14]: The [best attempt I know of](https://signal.org/blog/private-contact-discovery/) leverages [Trusted Execution Environments](https://en.wikipedia.org/wiki/Trusted_execution_environment), but for limited functionality using an implementation that's [far from bulletproof](https://en.wikipedia.org/wiki/Software_Guard_Extensions#Attacks).
