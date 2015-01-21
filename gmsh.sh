#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone https://geuz.org/svn/gmsh/trunk git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:live-clones/gmsh.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/gmsh/git-svn
# Pull.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
