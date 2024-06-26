#!/bin/sh

#Docker and OCI Hardening
echo "Fetching and Modifying the Docker and OCI Hardening post"
rm -rf './content/posts/linux/Docker and OCI Hardening.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.dev/main/content/posts/docker-hardening.md -o './content/posts/linux/Docker and OCI Hardening.md'
sed -i 's/title:.*/title: "Docker and OCI Hardening"/' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/draft:.*/d' './content/posts/linux/Docker and OCI Hardening.md'
sed -i "s/tags:.*/tags: ['Applications', 'Linux', 'Containers', 'Security']/" './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/docker-hardening/' './content/posts/linux/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/posts/linux/Docker and OCI Hardening.md'

#Securing OpenSSH with FIDO2
echo "Fetching and Modifying the OpenSSH with FIDO2 Hardening post"
rm -rf './content/posts/linux/Securing OpenSSH with FIDO2.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.dev/main/content/posts/openssh-fido2.md -o './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i 's/title:.*/title: "Securing OpenSSH with FIDO2"/' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/draft:.*/d' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i "s/tags:.*/tags: ['Operating Systems', 'Linux', 'Security']/" './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/openssh-fido2/' './content/posts/linux/Securing OpenSSH with FIDO2.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/posts/linux/Securing OpenSSH with FIDO2.md'

#Setting up MTA-STS with a custom domain on Proton Mail
echo "Fetching and Modifying the Setting up MTA-STS with a custom domain on Proton Mail post"
rm -rf './content/posts/linux/Setting up MTA-STS with a custom domain on Proton Mail.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.dev/main/content/posts/mta-sts.md -o './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i 's/title:.*/title: "Setting up MTA-STS with a custom domain on Proton Mail"/' './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i '/draft:.*/d' './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i "s/tags:.*/tags: ['Knowledge base', 'Security']/" './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/mta-sts/' './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/posts/knowledge/Setting up MTA-STS with a custom domain on Proton Mail.md'

# Blogs by Rohan Kumar (a.k.a Seirdy) currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitHub repo: https://github.com/Seirdy/seirdy.one

# Blogs by WfKe9vLwSvv7rN currently need to be manually ported, as he uses a lot of HTML inside of the source instead of just markdown.
# His GitLab repo: https://gitlab.com/WanderingComputerer/WanderingComputerer.gitlab.io/
