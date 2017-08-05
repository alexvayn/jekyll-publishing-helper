#!/bin/sh
set -e

function show_usage()
{
        echo ""
        echo "Usage: setup.sh -p [PROJECT_PATH] [OPTIONS]
    PROJECT_PATH:
        (Required) the full path of the project to be published
    OPTIONS:
      -?                  - show this usage info
      -s [BUCKET_NAME]    - causes the project to be published to the specified AWS s3
      -g                  - causes the project will be published to GitHub Pages
      -j                  - Jekyll build will be performed prior to publishing
      -h                  - Hugo build will be performed prior to publishing
    EXAMPLES:
        publish.sh -p /Users/myuser/my-project -g -h -s MyS3Bucket
    "
}

function check_var()
{
  varname="\$$1"
  value=$(eval " echo $varname ")

  if [ -z "$value" ]
  then
    echo "[ERROR] ${varname} is empty and required in order to proceed"
    show_usage
    exit 1
  fi

}

function hugo_build()
{
  echo "Running Hugo build..."
  pushd ${PROJECT_PATH}
  hugo
  popd
}

function jekyll_build()
{
  echo "Running Jekyll build..."
  pushd ${PROJECT_PATH}
  jekyll build --destination ./docs
  popd
}

function publish_github()
{
  echo "publishing to github"
  pushd ${PROJECT_PATH}
  git add . -v
  git commit -am "publishing generated content" -v
  git push origin master
  popd
}

function publish_s3()
{
  echo "publishing to s3"
  pushd ${PROJECT_PATH}
  aws s3 cp ./docs/ s3://${S3_BUCKET}/ --recursive
  popd
}

if [ -z "$1" ]
  then
    show_usage
    exit 1
fi

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts "?ghjp:s:" opt; do
  case "$opt" in
    \?)
        show_usage
        exit 0
        ;;
    g)  PUBLISH_GITHUB=true
        ;;
    h)  HUGO_BUILD=true
        ;;
    j)  JEKYLL_BUILD=true
        ;;
    p)  PROJECT_PATH=$OPTARG
        ;;
    s)  S3_BUCKET=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

echo "Publishing with the following options:"
echo "----------------------------------------------"
echo PROJECT_PATH  = "${PROJECT_PATH}"
echo PUBLISH_GITHUB     = "${PUBLISH_GITHUB}"
echo S3_BUCKET    = "${S3_BUCKET}"
echo JEKYLL_BUILD    = "${JEKYLL_BUILD}"
echo HUGO_BUILD    = "${HUGO_BUILD}"
echo "----------------------------------------------"

check_var PROJECT_PATH

if [ "${HUGO_BUILD}" = true ] ; then
    hugo_build
fi

if [ "${JEKYLL_BUILD}" = true ] ; then
    jekyll_build
fi

if [ "${PUBLISH_GITHUB}" = true ] ; then
    publish_github
fi

if [ ! -z "$S3_BUCKET" ]
then
      check_var S3_BUCKET
      publish_s3
fi
