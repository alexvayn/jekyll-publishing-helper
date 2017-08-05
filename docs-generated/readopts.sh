#!/bin/sh

function show_help()
{
  echo "showing help"
}

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts "ghjp:s:" opt; do
  case "$opt" in
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

echo PROJECT_PATH  = "${PROJECT_PATH}"
echo PUBLISH_GITHUB     = "${PUBLISH_GITHUB}"
echo S3_BUCKET    = "${S3_BUCKET}"
echo JEKYLL_BUILD    = "${JEKYLL_BUILD}"
echo HUGO_BUILD    = "${HUGO_BUILD}"
