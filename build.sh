#!/bin/bash
ARCH=$(uname -m)
git clone https://github.com/travis-ci/travis-build.git
cd ./travis-build
git checkout -t origin/enterprise-2.2
rm -f ./Dockerfile
cp ../Dockerfile.s390x ./Dockerfile
docker pull quay.io/montana/montana-s390x
docker build -t quay.io/montana/montana-s390x .
echo "$QUAY_BOT_PASSWORD" | docker login -u "$QUAY_BOT_USERNAME" --password-stdin quay.io
docker push quay.io/montana/montana-s390x
docker images
docker push quay.io/montana/montana-s390x
