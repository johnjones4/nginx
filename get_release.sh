#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/johnjones4/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

gh release download $(get_latest_release $1) -p ui.tar.gz -R johnjones4/$1
tar zxf ui.tar.gz
rm -rf public/$1 || true
mv $2/build public/$1
rm -rf $2
rm ui.tar.gz
