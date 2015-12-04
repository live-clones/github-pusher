#!/bin/sh -ue
#
# Preparation:
#   $ git clone git@github.com:trilinos/Trilinos.git
#   $ git remote add github-belos git@github.com:trilinos/belos.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/trilinos/source-upstream/" || exit 1
git pull origin master -q
# extract all commits into branch
git subtree split -P packages/belos -b belos
# push to github
git push github-belos belos:master
