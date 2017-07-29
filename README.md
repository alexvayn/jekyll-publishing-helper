# Jekyll GitHub Pages Setup Script

## What is this script and why do I need it?
The purpose of this script is to simplify and automate the one-time setup of your [Jekyll](https://jekyllrb.com/) project with [https://pages.github.com/](GitHub Pages).

By default, when you run a Jekyll build, it generates the static assets in the folder `_site`. In order to publish these assets as a GitHub page, you'll need to set up a separate GitHub repo and copy all the contents of this folder into the root of that project. Then, you'll still need to enable GitHub pages.

This script (`setup.sh`) lets you avoid having to maintain two separate projects by taking advantage of branching. After running this script, you'll have all your source Jekyll files and configs in the `master` branch and all your generated content in your `gh-pages` branch. As an added bonus, GitHub by design  recognizes this special branch and automatically publishes your page, without having to go to the repo's settings.

## Before you begin
* You'll need a GitHub account. Make sure you're able to authenticate with your user ID from the command line
* You'll also need to have a Jekyll project repo on your GitHub account. [Refer to the Jekyll Quick Start guide.](https://jekyllrb.com/docs/quickstart)

## One-Time Setup
* Export these environment variables in your `.bash_profile` and be sure to reload it:
    * `export GITHUB_USER` - your GitHub user ID (e.g., `alexvayn`)
    * `export PROJECT_HOME` - the directory where you keep your GitHub projects with a trailing forward slash (e.g., `/Users/alexvayn/projects/`)
* Run a `jekyll build` on your Jekyll project to generate the static files.
* Run the setup script as follows: `./setup.sh GITHUB_PROJECT`
    * `GITHUB_PROJECT` - the name of the project that holds the master Jekyll source and configs (e.g., `the-mixing-touch`)

* That's it! You should now be able to access your GitHub page at `https://GITHUB_USER.github.io/GITHUB_PROJECT/`
    * If your page doesn't look right, check the [Common Pitfalls](#pitfalls) section of this page

## Making updates to your site
* All your generated content will be located in `$PROJECT_HOME/static-generated/$GITHUB_PROJECT`
* Each time you re-run a jekyll build, navigate to this folder, commit and push to the `gh-pages` branch

## <a name="pitfalls"></a> Common Pitfalls
* If your CSS doesn't load properly, update the following line in your Jekyll project's `config.yml` to match your project name:
  * ```baseurl: "your-project-name"```
