#!/bin/bash
set -e

carthage || brew install carthage
tuist || curl -Ls https://install.tuist.io | bash

bundle install

echo "Fetching dependencies.."
tuist fetch

echo "Warming cache.."
tuist cache warm -x

echo "Generating project.."
rm -r *.xcodeproj
rm -r *.xcworkspace
tuist generate -n