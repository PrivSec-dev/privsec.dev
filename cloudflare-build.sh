#!/bin/bash

export GOPROXY=direct
export GOSUMD=off
export CGO_ENABLED=1

go install -tags extended github.com/gohugoio/hugo@latest

if [ "$CF_PAGES_BRANCH" == "main" ]; then
  hugo --minify
else
  hugo -b $CF_PAGES_URL --minify
fi
