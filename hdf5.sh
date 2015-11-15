#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone https://svn.hdfgroup.uiuc.edu/hdf5/trunk/
#   $ git remote add github git@github.com:live-clones/hdf5.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/hdf5/git-svn
# Pull from wherever.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
