#!/bin/bash

#Docker and OCI Hardening
echo "Fetching and Modifying the Docker and OCI Hardening post"
rm -rf './content/posts/linux/Docker and OCI Hardening.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/docker-hardening.md -o './content/posts/linux/Docker and OCI Hardening.md'
sed -i 's/title:.*/title: "Docker and OCI Hardening"/' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/draft:.*/d' './content/posts/linux/Docker and OCI Hardening.md'
sed -i "s/tags:.*/tags: ['Applications', 'Linux', 'Containers', 'Security']/" './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/docker-hardening/' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/posts/linux/Docker and OCI Hardening.md'

#Securing OpenSSH with FIDO2
echo "Fetching and Modifying the OpenSSH with FIDO2 Hardening post"
rm -rf './content/posts/linux/Securing OpenSSH with FIDO2.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/openssh-fido2.md -o './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i 's/title:.*/title: "Securing OpenSSH with FIDO2"/' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/draft:.*/d' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i "s/tags:.*/tags: ['Operating Systems', 'Linux', 'Security']/" './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/openssh-fido2/' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/posts/linux/Securing OpenSSH with FIDO2.md'

#Building GrapheneOS with Windows Subsystem for Linux
echo "Fetching and Modifying the Building GrapheneOS with Windows Subsystem for Linux post"
rm -rf './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
curl https://raw.githubusercontent.com/akc3n/akc3n.page/main/content/posts/grapheneos-wsl.md -o './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/title:.*/title: "Building GrapheneOS with Windows Subsystem for Linux"/' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/description:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i "s/tags:.*/tags: ['Operating Systems', 'Android']/" './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/TocOpen:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/hidemeta:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/hideSummary:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/searchHidden:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/ShowReadingTime:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/ShowBreadCrumbs:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/ShowPostNavLinks:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i 's/ShowWordCount:.*//' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/android/Building GrapheneOS with Windows Subsystem for Linux.md'

# Blogs by Rohan Kumar (a.k.a Seirdy) currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitHub repo: https://github.com/Seirdy/seirdy.one

# Blogs by WfKe9vLwSvv7rN currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitLab repo: https://gitlab.com/WanderingComputerer/WanderingComputerer.gitlab.io/