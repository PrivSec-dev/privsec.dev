#!/bin/bash

#F-Droid Security Analysis
rm -rf './content/apps/F-Droid Security Analysis.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/fdroid-issues.md -o './content/apps/F-Droid Security Analysis.md'
sed -i 's/title:.*/title: "F-Droid Security Analysis"/' './content/apps/F-Droid Security Analysis.md'
sed -i '/draft: false/d' './content/apps/F-Droid Security Analysis.md'
sed -i "s/tags:.*/tags: ['applications', 'android', 'security']/" './content/apps/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/apps/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/fdroid-issues' './content/apps/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/apps/F-Droid Security Analysis.md'

#Docker and OCI Hardening
rm -rf './content/os/Docker and OCI Hardening.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/fdroid-issues.md -o './content/os/Docker and OCI Hardening.md'
sed -i 's/title:.*/title: "Docker and OCI Hardening"/' './content/os/Docker and OCI Hardening.md'
sed -i '/draft: false/d' './content/os/Docker and OCI Hardening.md'
sed -i "s/tags:.*/tags: ['operating systems', 'linux', 'container', 'security']/" './content/os/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/os/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/docker-hardening/' './content/os/Docker and OCI Hardening.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/os/Docker and OCI Hardening.md'