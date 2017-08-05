# Jekyll Helper Script: /docs generated approach

## Purpose

This approach is a good one if you want to commit both the Jekyll source files and the generated content to GitHub, as well as publish the content to multiple destinations (GitHub Pages and AWS S3).

## Before you begin
* You'll need a GitHub account. Make sure you're able to authenticate with your user ID from the command line
* You'll also need to have a Jekyll project repo on your GitHub account. [Refer to the Jekyll Quick Start guide.](https://jekyllrb.com/docs/quickstart)

## One-time setup
* Run a Jekyll build, specifying `/docs` as the output folder for the generated content:
    * ```jekyll build --destination ./docs```
* Commit the newly generated docs folder to GitHub
* In GitHub, go to the repo settings -> GitHub Pages -> Source -> select "master branch /docs folder"

## Publishing changes

## Jekyll Starting Projects with Customized Themes

If you want a couple of good base Jekyll projects with customized themes to get you started, these are my go-to ones:
* https://github.com/daviddarnes/alembic.git
* https://github.com/alexvayn/rabbit-hole

To get started with these, do the following:
* `git clone [PROJECT_NAME]`
* `jekyll build`
* `jekyll serve`
