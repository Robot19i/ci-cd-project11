#!/bin/bash

docker run -d -p 9889:80 --name ci-cd-project11 --mount type=bind,src=/var/lib/jenkins/workspace/ci-cd-project11/,dst=/usr/share/nginx/html/ nginx
docker ps -a
curl -I http://localhost:9889 2>/dev/null | head -n 1 | cut -d$' ' -f2
echo -n 'http://localhost:9889/index.html' | openssl md5 -hex
docker stop ci-cd-project11
docker rm ci-cd-project11
docker ps -a
