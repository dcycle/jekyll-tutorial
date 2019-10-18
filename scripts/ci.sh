#!/bin/bash
set -e

echo "=> Build the application"
./scripts/build.sh

echo "=> See if our site was built correctly using https://hub.docker.com/_/httpd"
# Remove old containers if something went wrong during a previous run.
docker kill jekyll-tutorial 2>/dev/null || true
docker rm jekyll-tutorial 2>/dev/null || true
docker run -dit --name jekyll-tutorial \
  -p 80 \
  -v "$PWD"/jekyll/_site:/usr/local/apache2/htdocs/ \
  httpd
echo "=> Check if '<body>' exists on our built site"
curl http://$(docker port jekyll-tutorial 80) | grep '<body>'

docker kill jekyll-tutorial
docker rm jekyll-tutorial

echo "=> Everything seems ok!"
echo ""
