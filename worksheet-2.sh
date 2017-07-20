#!/bin/sh

## Configure git
git config --global user.name Poudel1
git config --global user.email rajendra.poudel@noaa.gov

## Change the "origin" remote URL and push
git remote set-url origin https://github.com/Poudel1/handouts.git

## Set the SESYNC-CI repository upstream and pull updates
git remote add upstream https://github.com/sesync-ci/handouts.git
git pull upstream master
