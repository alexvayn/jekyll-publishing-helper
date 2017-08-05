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
* If you're publish to AWS S3, install the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) and [set up your AWS Access Keys](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration) on your machine
* Open the `env_vars.sh` and update the variables to match your system:
    * `PROJECT_HOME` - the directory where you keep your GitHub projects, with a trailing forward slash (e.g., `/Users/alexvayn/projects/`)

## Publishing updates to your site
* Export these environment variables in your `.bash_profile` and be sure to reload it:
    * `export GITHUB_USER` - your GitHub user ID (e.g., `alexvayn`)
    * `export PROJECT_HOME` - the directory where you keep your GitHub projects with a trailing forward slash (e.g., `/Users/alexvayn/projects/`)
* Run the `publish.sh` script as follows:
    * `./publish.sh PROJECT_NAME --github --s3`
        * specify `github` if you want to publish to GitHub pages
        * specify `s3` if you want to publish to AWS S3
