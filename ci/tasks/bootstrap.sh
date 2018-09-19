#!/usr/bin/env bash
set -e

echo "blue" > $ARTIFACTORY_COLOR_FILENAME

cp $ARTIFACTORY_COLOR_FILENAME blue-green-output/$ARTIFACTORY_COLOR_FILENAME
