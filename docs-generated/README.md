# Jekyll Helper Script: /docs generated approach

## Purpose

This approach is perfect if you want to commit both the Jekyll source files and the generated content to GitHub, as well as publish the content to multiple destinations (GitHub Pages and AWS S3).

You'll be able to save a ton of time by not having to run a lot of manual commands every time you make updates to your site.

## Before you begin
* You'll need a GitHub account. Make sure you're able to authenticate with your user ID from the command line
* You'll also need to have a Jekyll project repo on your GitHub account. [Refer to the Jekyll Quick Start guide.](https://jekyllrb.com/docs/quickstart)
* If you're planning to publish to AWS S3, be sure to install the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) and [set up your AWS Access Keys](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration) on your machine

## One-time setup
* Run a Jekyll build, specifying `/docs` as the output folder for the generated content:
    * ```jekyll build --destination ./docs```
* Commit the newly generated docs folder to GitHub
* Enable GitHub Pages: in your GitHub account, go to the repo settings -> GitHub Pages -> Source -> select "master branch /docs folder"

## Publishing updates to your site
* Run the `publish.sh` script as follows:
    * `./publish.sh -p [PROJECT_PATH] [OPTIONS]`
    * `[PROJECT_PATH]` - the full path to the project you want to publish (Tilde ~ shortcut supported)
    * `OPTIONS`:
        * `-?`                  - show this usage info
        * `-s [BUCKET_NAME]`    - causes the generated content from the `docs` folder to be published to the specified AWS S3 bucket
        * `-g`                  - causes the project to be published to GitHub Pages
        * `-j`                  - Jekyll build will be performed prior to publishing
        * `-h`                  - Hugo build will be performed prior to publishing
    * Examples:
        * Run a Jekyll Build and Publish to S3: `publish.sh -p ~/my-project -j -s MyS3Bucket`
        * Run a Jekyll Build and Publish to GitHub Pages: `publish.sh -p ~/my-project -j -g`
        * Run a Hugo Build and Publish to GithHub Pages and S3: `publish.sh -p ~/my-project -h -g -s MyS3Bucket`
    * Note: the order of the options does not matter, as long as you keep the key-value ones together. For example, `publish.sh -p ~/my-project -j -s MyS3Bucket` and `publish.sh -j -s MyS3Bucket -p ~/my-project` are identical.
