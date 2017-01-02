#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone --authors-prog authors.sh https://geuz.org/svn/gmsh/trunk git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:live-clones/gmsh.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/gmsh/git-svn" || exit 1
# Pull.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
