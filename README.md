# PrivSec.dev
A practical approach to Privacy and Security

[![Netlify Status](https://api.netlify.com/api/v1/badges/ba0d8ddc-031b-4c16-8240-9929a4ad201a/deploy-status)](https://app.netlify.com/sites/privsec-dev/deploys)

## Licensing

The website content (under `/content`) is under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) license.

The articles originally posted on [wonderfall.dev](https://wonderfall.dev), [seirdy.one](https://seirdy.one), and [akc3n.org](https://akc3n.org) are under the same license.

The Hugo Framework used to create this website is under the [Apache License](https://github.com/gohugoio/hugo/blob/master/LICENSE).

The WonderMod theme used for the website and modifications made by us are under the [MIT License](https://github.com/adityatelange/hugo-PaperMod/blob/master/LICENSE). 

## Netlify Previews

We use [Netlify](https://netlify.com) to host our website and generate previews. Simply add your articles inside of `/content` or make any modifications that you want, open a new Pull Request and a preview page will be generated for you automatically.

## Local Development

1. [Install Hugo](https://gohugo.io/getting-started/installing/)
1. Clone this repository: `git clone --recurse-submodules https://github.com/PrivSec-dev/privsec.dev`
1. Run `hugo serve` to start the local development server at (by default) `http://localhost:1313`
   - Alternatively run `hugo` to simply build the site into the `/public` directory

- Run `git submodule update --merge` to update the [WonderMod theme](https://github.com/Wonderfall/hugo-WonderMod) to the version specified in this repo
  - Run `git submodule update --remote --merge` to update to the upstream master branch of WonderMod
- Run `./external-blogs.sh` to pull the latest versions of the articles from [wonderfall.dev](https://wonderfall.dev) and place them in `/content`
