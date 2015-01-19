#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone svn://svn.openttd.org/trunk git-svn
#   $ cd git-svn
#   $ git svn fetch # if the above aborts
#   $ git svn fetch
#   $ ...
#   $ git remote add github git@github.com:nschloe/openttd.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/openttd/git-svn
# Pull.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
