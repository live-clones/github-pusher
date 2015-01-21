#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone http://svn.code.sf.net/p/netgen-mesher/code/netgen git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:live-clones/netgen.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/netgen/git-svn
# Pull.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
