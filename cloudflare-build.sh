#!/bin/bash

#curl -L -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep "browser_download_url.*extended.*linux-amd64.tar.gz" | cut -d : -f 2,3 | sed 's/"//g' | xargs wget

wget https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_0.119.0_Linux-64bit.tar.gz

tar xvf ./*.tar.gz
chmod u+x ./hugo

if [ "$CF_PAGES_BRANCH" == "main" ]; then
  ./hugo --minify
else
  ./hugo -b "$CF_PAGES_URL"
fi
