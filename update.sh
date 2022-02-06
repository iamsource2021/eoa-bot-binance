#!/bin/bash -x
tsc
npx babel src --out-dir lib --extensions \".ts,.tsx,.js\" --source-maps inline
git add .
git commit -m "revision version $1"
git push origin master
git tag -a $1 -m "v.$1"
npm run prepublish --version_at=$1