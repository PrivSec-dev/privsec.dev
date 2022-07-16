#!/bin/bash

#F-Droid Issues Blog
rm -rf './content/software/F-Droid Security Analysis.md'
curl https://raw.githubusercontent.com/Wonderfall/wonderfall.github.io/main/content/posts/fdroid-issues.md -o './content/software/F-Droid Security Analysis.md'
sed -i 's/title: "A brief and informal analysis of F-Droid security"/title: "F-Droid Security Analysis"/' './content/software/F-Droid Security Analysis.md'
sed -i '/draft: false/d' './content/software/F-Droid Security Analysis.md'
sed -i "s/tags:.*/tags: ['software', 'android', 'security']/" './content/software/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a ShowCanonicalLink: true' './content/software/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a canonicalURL: https://wonderfall.dev/fdroid-issues' './content/software/F-Droid Security Analysis.md'
sed -i '/^tags:.*/a author: Wonderfall' './content/software/F-Droid Security Analysis.md'