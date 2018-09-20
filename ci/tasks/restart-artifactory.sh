#!/usr/bin/env bash
set -e

#clone the repo
git clone https://$PASSWORD@$GIT_REPO_URL
git clone --single-branch -b color https://$PASSWORD@$GIT_REPO_URL colorBranch

#meow the color
color=`cat colorBranch/color`

# make it colorful!
cd s1p-concourse-spring-music
cd bin

#add git config so it stops complaining about not having user info
git config --global user.email "bbyers@pivotal.io"
git config --global user.name "Concourse"
git config --global push.default matching

#change the color using the scripts
echo "Current color: "$color
if [ "$color" == "blue" ]; then
  echo "turning banner green"
  ./makeItGreen.sh
  echo "green" > ../../colorBranch/color
else
  echo "turning banner blue"
  ./makeItBlue.sh
  echo "blue" > ../../colorBranch/color
fi

echo "New color to save"
newColor=`cat ../../colorBranch/color`
cd ../../colorBranch
git add color
git commit -m "saving color $newColor"
git push
