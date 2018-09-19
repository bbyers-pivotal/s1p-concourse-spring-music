#!/usr/bin/env bash
set -e

#clone the repo
git clone https://$PASSWORD@github.com/s1p-demo/concourse-spring-music.git

#meow the color
color=`cat blue-treen-output/$ARTIFACTORY_COLOR_FILENAME`

# make it colorful!
cd concourse-spring-music
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
  echo "green" > ../../$ARTIFACTORY_COLOR_FILENAME
else
  echo "turning banner blue"
  ./makeItBlue.sh
  echo "blue" > ../../$ARTIFACTORY_COLOR_FILENAME
fi

cp ../../$ARTIFACTORY_COLOR_FILENAME ../../blue-green-output/$ARTIFACTORY_COLOR_FILENAME
