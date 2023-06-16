#!/bin/bash

if [ "$CF_PAGES_BRANCH" == "main" ]; then
  hugo --minify
else
  hugo -b $CF_PAGES_URL --minify
fi
