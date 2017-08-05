# Jekyll GitHub Pages Setup Script

## What is this script and why do I need it?
The purpose of these scripts is mainly for reference and to demonstrate how you can set up of your [Jekyll](https://jekyllrb.com/) project with the generated static files needed for [GitHub Pages](https://pages.github.com/) in a separate branch.

This script (`setup.sh`) takes advantage of a special branch that GitHub recognizes. After running this script, you'll have all your source Jekyll files and configs in the `master` branch of your repo and all your generated content in the `gh-pages` branch. GitHub recognizes this branch and automatically publishes your page, without having to enable it in the repo's settings.

Or you can skip all this and try the [much simpler approach](#simpler) on the bottom of this page.

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
* When you're ready to publish new changes, run the publishing script as follows: `./publish.sh GITHUB_PROJECT`
* This will re-run a build on your Jekyll project and comit all the generated static content to the `gh-pages` branch

## <a name="pitfalls"></a> Common Pitfalls
* If your CSS doesn't load properly, update the following line in your Jekyll project's `config.yml` to match your project name:
  * ```baseurl: "your-project-name"```

## <a name="simpler"></a>A Simpler Approach
* **Update!** There's actually a much simpler way of doing this! Just specify the /docs folder as your build output
    * ```jekyll build --destination ./docs```
    * After you do this, go to the project settings in GitHub and enable GitHub Pages using the /docs folder.
