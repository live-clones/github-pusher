#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone http://sourceforge.net/p/soundtouch/code/HEAD/tree/trunk/
#   $ git remote add github git@github.com:live-clones/soundtouch.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/soundtouch/git-svn
# Pull from wherever.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
