# Ubuntu GitHub labels
[![CircleCI build status](https://circleci.com/gh/canonical-web-and-design/labels.svg?style=shield)](https://circleci.com/gh/canonical-web-and-design/labels) [![Code coverage](https://codecov.io/gh/canonical-web-and-design/labels/branch/master/graph/badge.svg)](https://codecov.io/gh/canonical-web-and-design/labels)

## Usage

1. first remove all labels in the repo, as any dups are ignored
2. install [git-lablemaker](https://github.com/himynameisdave/git-labelmaker) (see below)
```
$ npm install git-labelmaker -g
```
3. in a terminal, go to the repo you want to add labels and run git-labelmaker
```
$ git-labelmaker
```
4. For the first time you use the app, you will need to follow the instructions to enter an oauth token, and `Add Labels From a Package`. Point the package to labels.json in this repository (e.g. `../labels/labels.json`) 

## Notes

* be sure to git clone with the ssh version, not https or it will not work!
