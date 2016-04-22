#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone svn://svn.debian.org/debian-science/packages/fenics
#   $ git remote add github git@github.com:live-clones/debian-science-fenics.git
#

# Set SSH agent variables.
. $HOME/.keychain/`/bin/hostname`-sh

cd ${HOME}/software/debian-science-fenics
# Pull from wherever.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
