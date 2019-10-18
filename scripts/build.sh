#!/bin/bash
set -e

docker run --rm \
  --volume="$PWD/jekyll:/srv/jekyll" \
  -it jekyll/jekyll:4 \
  jekyll build --trace
