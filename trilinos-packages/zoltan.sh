#!/bin/sh -ue
#
# Preparation:
#   $ git clone https://software.sandia.gov/trilinos/repositories/source-upstream
#   $ git remote add github-zoltan git@github.com:trilinos/zoltan.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/trilinos/source-upstream/
git pull origin master -q
# extract all zoltan commits into the respective branch
git subtree split -P packages/zoltan -b zoltan
# push to github
git push github-zoltan zoltan:master
