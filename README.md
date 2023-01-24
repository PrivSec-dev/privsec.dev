# PrivSec.dev

_\~&ensp;A practical approach to Privacy and Security&ensp;\~_

[![Netlify Status](https://api.netlify.com/api/v1/badges/ba0d8ddc-031b-4c16-8240-9929a4ad201a/deploy-status)](https://app.netlify.com/sites/privsec-dev/deploys)

## Licensing

Prospective contributors are encouraged to review [CONTRIBUTING.md](/CONTRIBUTING.md) and the [Contributor License Agreement](https://github.com/PrivSec-dev/contributor-license-agreement).

Posts are licensed under the [Creative&nbsp;Commons Attribution&#8209;ShareAlike&nbsp;4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/). _Please make sure to attribute the author(s) properly and include a link to the original publication when applicable._

[Hugo](https://gohugo.io/), the static site generator used to build the site, is licensed under the [Apache&nbsp;License&nbsp;2.0](https://github.com/gohugoio/hugo/blob/master/LICENSE).

The [WonderMod](https://github.com/Wonderfall/hugo-WonderMod) theme (and its upstream [PaperMod](https://github.com/adityatelange/hugo-PaperMod)) is licensed under the [MIT&nbsp;License](https://github.com/Wonderfall/hugo-WonderMod/blob/master/LICENSE). Except where otherwise noted, PrivSec.dev's modifications to WonderMod are also licensed under the MIT&nbsp;License.

## Hosting (Netlify)

The https://privsec.dev website is hosted by [Netlify](https://netlify.com). Netlify will automatically generate previews for pull requests and on pull request updates.

## Local Working Environment

1. Install [Git](https://git-scm.com/downloads) and [Hugo](https://gohugo.io/getting-started/installing/).
   - Most users should simply use the [self&#8209;contained Hugo executable for their platform](https://github.com/gohugoio/hugo/releases). Linux package managers often provide old versions of Hugo.
1. Clone this repository: `git clone --recurse-submodules https://github.com/PrivSec-dev/privsec.dev`.
1. Run `hugo serve` to start the local development server at (by default) `http://localhost:1313`.
   - Alternatively run `hugo` to simply build the site into the `public/` directory.

- Run `git submodule update --merge` to update the [WonderMod theme](https://github.com/Wonderfall/hugo-WonderMod) to the version specified in this repo.
  - Run `git submodule update --remote --merge` to update to the upstream master branch of WonderMod.
- Run `./external-blogs.sh` to pull the latest versions of certain posts from their canonical (external) sources.
