#!/bin/sh
set -o errexit

# Add these environment variables to your .bash_profile. Modify them to match your system.
#GITHUB_USER=alexvayn
#PROJECT_HOME=/Users/alexvayn/projects/

function show_usage()
{
        echo ""
        echo "Usage: publish.sh [OPTIONS]
    OPTIONS:
        project_name        - the name of the Jekyll GitHub project
    EXAMPLES:
        setup.sh my-project
    "
}

function is_missing_var()
{
  name="\$$1"
  value=$(eval " echo $name ")
  if [ -z "$value" ]
  then
      missing_vars="$missing_vars$1 ($2)\\n"
  else
      echo "$1: $value"
  fi
}

function check_env_vars()
{
    missing_vars=
    is_missing_var GITHUB_USER "GitHub user id"
    is_missing_var PROJECT_HOME "Jekyll project name"

    if [ ! -z "$missing_vars" ]
    then
        echo "[ERROR] Missing the following environment variables. Did you export them in your .bash_profile?"
        echo "     $missing_vars"
        exit 1
    fi
}

if [ -z "$1" ]
  then
    show_usage
    exit 1
  else
    check_env_vars
fi



GITHUB_PROJECT=$1
GITHUB_REPO=https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}.git
STATIC_GEN_PATH=${PROJECT_HOME}/static-generated
MASTER_REPO_PATH=${PROJECT_HOME}/${GITHUB_PROJECT}

echo "Publishing content for project [${GITHUB_PROJECT}]......"

pushd ${MASTER_REPO_PATH}
jekyll build

pushd ${STATIC_GEN_PATH}/${GITHUB_PROJECT}
git add .
git commit -avm "publishing generated static content"
git push origin gh-pages

popd
popd
