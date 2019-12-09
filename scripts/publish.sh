#!/bin/bash

# build the PPT
node architecture.js

git clone --depth=1 --branch=gh-pages "https://${GITHUB_TOKEN}@github.com/dnguyenv/myarchitecture" build

cp ibmcloud-architecture-diagram-template.pptx build

git config --global push.default simple
git config --global user.email "dnguyenv@us.ibm.com"
git config --global user.name "dnguyenv"

# commit to gh-pages
(cd build && git init && git fetch --depth=10000 origin && git add . && git commit -m "new deck" && git checkout -b master && git remote add page https://${GITHUB_TOKEN}@github.com/dnguyenv/iarchitecture ; git push -f page master)
