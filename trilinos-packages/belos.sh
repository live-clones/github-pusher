#!/bin/sh -ue
#
# Preparation:
#   $ GIT_SSL_NO_VERIFY=1 git clone https://software.sandia.gov/trilinos/repositories/publicTrilinos
#   $ git remote add github-belos git@github.com:trilinos/belos.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)


cd ${HOME}/software/trilinos/publicTrilinos/
GIT_SSL_NO_VERIFY=1 git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/belos -b belos
# push to github
git push github-belos belos:master
