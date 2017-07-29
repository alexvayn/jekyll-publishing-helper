#!/bin/sh

# Assumptions:
# 1) GitHub repo exists and only has a master branch
# 2) jekyll build has been run on the master repo

GITHUB_USER=alexvayn
GITHUB_PROJECT=jekyll-playground
PROJECT_HOME=/Users/avaynshteyn/projects/play/

GITHUB_REPO=https://github.com/$GITHUB_USER/$GITHUB_PROJECT.git
STATIC_GEN_PATH=$PROJECT_HOME/static-generated
MASTER_REPO_PATH=$PROJECT_HOME/$GITHUB_PROJECT

# Create symlink from _site folder to the static generated location
mkdir -p $STATIC_GEN_PATH
ln -s $MASTER_REPO_PATH/_site $STATIC_GEN_PATH/$GITHUB_PROJECT

pushd $STATIC_GEN_PATH/$GITHUB_PROJECT

# Initialize this directory as a separate repo
git init
git remote add origin $GITHUB_REPO
git checkout -b gh-pages
git add .
git status
git commit -m "initialzed static files"
git push --set-upstream origin gh-pages

popd
