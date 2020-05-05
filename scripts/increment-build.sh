#!/bin/bash
set -e

# Generate icons
#flutter pub run flutter_launcher_icons:main

# Find and increment the version number.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Commit and tag this change.
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`

echo "New version: $version"
git commit -m "Bump version to $version" pubspec.yaml
git tag $version
