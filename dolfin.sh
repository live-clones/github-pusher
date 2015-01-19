#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git@bitbucket.org:fenics-project/dolfin.git bare-source
#   $ cd bare-source
#   $ git remote set-url --push origin git@github.com:nschloe/dolfin.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/fenics/dolfin/bare-source
# Pull from bitbucket.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
