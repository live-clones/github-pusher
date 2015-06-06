#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone http://googletest.googlecode.com/svn/trunk/ git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:live-clones/googletest.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/googletest/git-svn
# Pull.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
