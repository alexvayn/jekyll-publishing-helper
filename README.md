# Jekyll Publishing Helper Scripts

## Purpose
These scripts are intended to help automate and simplify your Jekyll content publishing workflow, including the initial project setup. At the moment, the supported publishing endpoints are:

* GitHub Pages
* AWS S3

## Jekyll Setup Approaches

Your Jekyll Setup and publishing workflow will largely depend on where you're planning to publish your content.

### Source files in Master Branch

If all you're planning to do is publish your site to GitHub pages, this is by far the simplest approach. _You don't need any scripts._ Just commit your Jekyll project to the master branch of your GitHub repo and enable GitHub Pages:
* In GitHub, go to the repo settings -> GitHub Pages -> Source -> select "master branch"

### [Source files in Master branch, generated content in `/docs` folder](./docs-generated)

This is almost the same thing as above, but you generate your static content into the `/docs` folder using the `--destination` option.

### [Source files in Master branch, generated content in `gh-pages` branch](./branch-generated)

This was mostly an experimental set of scripts that I put together before I realized that GitHub automatically generates the Pages from you Jekyll project. It's an overthought approach, but it does work and I've keep these scripts for reference.

## Jekyll starting projects with customized themes

If you want a couple of good base Jekyll projects with customized themes to get you started, these are my go-to ones:
* https://github.com/daviddarnes/alembic.git
* https://github.com/alexvayn/rabbit-hole

To get started with these, do the following:
* `git clone [PROJECT_NAME]`
* `jekyll build`
* `jekyll serve`
