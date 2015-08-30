#!/bin/sh -ue
#
# Preparation:
#   $ git clone git@bitbucket.org:fathomteam/moab.git source-upstream
#   $ cd source-upstream
#   $ git remote add github git@github.com:live-clones/moab.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/moab/bare-source
# Pull from bitbucket.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
