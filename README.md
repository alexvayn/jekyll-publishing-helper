# Jekyll GitHub Pages Setup Script

## One-Time Setup
* Run a jekyll build on your master Jekyll project to generate the static files
* Open setup.sh and update the following variables to match your settings:
    * GITHUB_USER - your GitHub user ID (e.g., alexvayn)
    * GITHUB_PROJECT - the name of the project that holds the master Jekyll source and configs
    * PROJECT_HOME - the directory where you normally keep your GitHub projects
* Run the script as follows: `./setup.sh`
* That's it! You should now be able to access your GitHub page at `https://GITHUB_USER.github.io/GITHUB_PROJECT/`

## Making updates to your site
* All your generated content will be located in `$PROJECT_HOME/static-generated/$GITHUB_PROJECT`
* Each time you re-run a jekyll build, navigate to this folder, commit and push to the `gh-pages` branch

## Note
* If your CSS doesn't load properly, update the following line in your Jekyll project's `config.yml` to match your project name:
  * ```baseurl: "your-project-name"```
