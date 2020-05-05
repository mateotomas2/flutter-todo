#!/bin/bash
set -e
echo "Generating android release"

flutter build appbundle --release --target-platform android-arm,android-arm64,android-x64
