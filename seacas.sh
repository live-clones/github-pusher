#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git://git.code.sf.net/p/seacas/code source
#   $ cd source
#   $ git remote set-url --push origin git@github.com:live-clones/seacas.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/seacas/pristine
# Pull from bitbucket.
git fetch -p origin
# Push to GitHub.
git push --mirror -q
