#! /bin/sh

# get release tarball from GitHub and extract it
curl -sLo /tmp/gh.tar.gz https://github.com/cli/cli/releases/download/v2.47.0/gh_2.47.0_linux_amd64.tar.gz
tar xzvf /tmp/gh.tar.gz -C /tmp

# create user-local bin directory; it's already part of $PATH
mkdir /home/eduk8s/bin

# move gh binary to user-local bin directory
mv /tmp/gh_2.47.0_linux_amd64/bin/gh /home/eduk8s/bin/