#!/bin/sh -ue
#
# Preparation:
#   $ GIT_SSL_NO_VERIFY=1 git clone https://software.sandia.gov/trilinos/repositories/publicTrilinos
#   $ git remote add github-piro git@github.com:trilinos/piro.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"


cd ${HOME}/software/trilinos/publicTrilinos/
GIT_SSL_NO_VERIFY=1 git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/piro -b piro
# push to github
git push github-piro piro:master
