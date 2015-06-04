#!/bin/sh -ue
#
# Preparation (see <http://stackoverflow.com/a/1089221/353337>):
#   $ sudo apt install mercurial-git
#   Add
#     [extensions]
#     hgext.bookmarks =
#     git =
#   to your ~/.hgrc.
#   $ cd ~/software/vim/
#   $ hg clone https://vim.googlecode.com/hg/ upstream
#   $ cd upstream
#   $ hg bookmark -r default master
#   $ Add
#     [git]
#     intree = true
#   to .hg/hgrc (in the repo).
#   $ hg gexport # may take some time
#   $ git remote add github git@github.com:live-clones/vim.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/vim/upstream/
# Pull from BitBucket and merge it into git
hg pull -q
hg gexport
# Push to GitHub.
git push github master --tags -q
