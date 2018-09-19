#!/usr/bin/env bash
set -e

echo "blue" > $ARTIFACTORY_COLOR_REGEX

cp $ARTIFACTORY_COLOR_REGEX blue-green-output/$ARTIFACTORY_COLOR_REGEX
