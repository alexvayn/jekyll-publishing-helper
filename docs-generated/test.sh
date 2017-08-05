#!/bin/bash

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -p|--project)
    PROJECT_PATH="$2"
    shift # past argument
    ;;
    -s|--s3-bucket)
    S3_BUCKET="$2"
    shift # past argument
    ;;
    -g|--github)
    PUBLISH_GITHUB=true
    ;;
    -j|--jekyll)
    JEKYLL_BUILD="YES"
    ;;
    -h|--hugo)
    HUGO_BUILD="YES"
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
echo PROJECT_PATH  = "${PROJECT_PATH}"
echo PUBLISH_GITHUB     = "${PUBLISH_GITHUB}"
echo S3_BUCKET    = "${S3_BUCKET}"
echo JEKYLL_BUILD    = "${JEKYLL_BUILD}"
echo HUGO_BUILD    = "${HUGO_BUILD}"
