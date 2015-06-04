#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git@bitbucket.org:petsc/petsc.git bare-source
#   $ cd bare-source
#   $ git remote set-url --push origin git@github.com:live-clones/petsc.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/petsc/bare-source
# Pull from bitbucket.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
