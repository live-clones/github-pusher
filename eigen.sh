#!/bin/sh -ue
#
# Preparation (see <http://stackoverflow.com/a/1089221/353337>):
#   $ sudo apt install mercurial-git
#   Add 
#     [extensions]
#     hgext.bookmarks =
#     git =
#   to your ~/.hgrc.
#   $ cd ~/software/eigen/
#   $ hg clone https://bitbucket.org/eigen/eigen/ upstream
#   $ cd upstream
#   $ hg bookmark -r default master
#   $ Add
#     [git]
#     intree = true
#   to .hg/hgrc (in the repo).
#   $ hg gexport # may take some time
#   $ git remote add github git@github.com:live-clones/eigen.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/eigen/upstream/" || exit 1
# Pull from BitBucket and merge it into git
hg pull -q
hg gexport
# Push to GitHub.
git push github master --tags -q
