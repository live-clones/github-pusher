#!/bin/sh -ue
#
# Preparation:
#   $ GIT_SSL_NO_VERIFY=1 git clone https://software.sandia.gov/trilinos/repositories/publicTrilinos
#   $ git remote add github-zoltan git@github.com:trilinos/zoltan.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/trilinos/publicTrilinos/
GIT_SSL_NO_VERIFY=1 git pull origin master -q
# extract all zoltan commits into the respective branch
git subtree split -P packages/zoltan -b zoltan
# push to github
git push github-zoltan zoltan:master
