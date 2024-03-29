#!/bin/bash

# git clone git@github.com:Alice52/dotfiles.git
git clone git@github.com:private-repoes/interview.git ../../interview
git clone git@github.com:Alice52/algorithms.git ../../algorithms

git clone git@github.com:Alice52/tutorials.git ../../tutorials
cd ../../tutorials && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:Alice52/spring-5.2.x.git ../../spring-5.2.x
git clone git@github.com:Alice52/project.git ../../project

git clone git@github.com:Alice52/practice.git ../../practice
cd ../../practice && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:Alice52/tools.git ../../tools
cd ../../tools && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:Alice52/graphql.git ../../graphql
cd ../../graphql && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:Alice52/docker.git ../../docker
git clone git@github.com:Alice52/Alice52.git ../../Alice52
git clone git@github.com:Alice52/diagrams.git ../../diagrams

git clone git@github.com:Alice52/system-design.git ../../system-design
cd ../../system-design && git submodule init && git submodule update --remote && ../dotfiles/github

# put this to last command due to rpc/grpc modules maybe failed
git clone git@github.com:Alice52/java-ocean.git ../../java-ocean
cd ../../java-ocean && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:Alice52/lite-starter.git ../../lite-starter
cd ../../lite-start && git submodule init && git submodule update --remote && ../dotfiles/github

git clone git@github.com:fork-repoes/uid-generator.git ../../uid-generator
git clone git@github.com:fork-repoes/gin-vue-admin.git ../../gin-vue-admin
