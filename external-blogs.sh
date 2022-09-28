#!/bin/bash

#F-Droid Security Analysis
echo "Fetching and Modifying the F-Droid Security Issues post"
rm -rf './content/apps/F-Droid Security Issues.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/fdroid-issues.md -o './content/apps/F-Droid Security Issues.md'
sed -i 's/title:.*/title: "F-Droid Security Issues"/' './content/apps/F-Droid Security Issues.md'
sed -i '/draft:.*/d' './content/apps/F-Droid Security Issues.md'
sed -i "s/tags:.*/tags: ['Applications', 'Android', 'Security']/" './content/apps/F-Droid Security Issues.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/apps/F-Droid Security Issues.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/fdroid-issues' './content/apps/F-Droid Security Issues.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/apps/F-Droid Security Issues.md'


#Docker and OCI Hardening
echo "Fetching and Modifying the Docker and OCI Hardening post"
rm -rf './content/apps/Docker and OCI Hardening.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/docker-hardening.md -o './content/apps/Docker and OCI Hardening.md'
sed -i 's/title:.*/title: "Docker and OCI Hardening"/' './content/apps/Docker and OCI Hardening.md'
sed -i '/draft:.*/d' './content/apps/Docker and OCI Hardening.md'
sed -i "s/tags:.*/tags: ['Applications', 'Linux', 'Container', 'Security']/" './content/apps/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/apps/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/docker-hardening/' './content/apps/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/apps/Docker and OCI Hardening.md'

#Securing OpenSSH with FIDO2
echo "Fetching and Modifying the OpenSSH with FIDO2 Hardening post"
rm -rf './content/os/Securing OpenSSH with FIDO2.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/openssh-fido2.md -o './content/os/Securing OpenSSH with FIDO2.md'
sed -i 's/title:.*/title: "Securing OpenSSH with FIDO2"/' './content/os/Securing OpenSSH with FIDO2.md'
sed -i '/draft:.*/d' './content/os/Securing OpenSSH with FIDO2.md'
sed -i "s/tags:.*/tags: ['Operating Systems', 'Linux', 'Security']/" './content/os/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/os/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/openssh-fido2/' './content/os/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/os/Securing OpenSSH with FIDO2.md'

# Blogs by Rohan Kumar (a.k.a Seirdy) currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitHub repo: https://github.com/Seirdy/seirdy.one

# Blogs by WfKe9vLwSvv7rN currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitLab repo: https://gitlab.com/WanderingComputerer/WanderingComputerer.gitlab.io/