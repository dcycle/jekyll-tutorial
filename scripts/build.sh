#!/bin/bash
set -e

DESTINATION_DIR=jekyll/_site
echo " => Creating our destination directory, $DESTINATION_DIR"
mkdir -p "$DESTINATION_DIR"

echo " => Building our site"
docker run --rm \
  --volume="$PWD/jekyll:/srv/jekyll" \
  -it jekyll/jekyll:4 \
  jekyll build --trace
