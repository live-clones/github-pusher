#!/bin/sh -ue
#
# Preparation:
#   $ GIT_SSL_NO_VERIFY=1 git clone https://software.sandia.gov/trilinos/repositories/publicTrilinos
#   $ git remote add github-thyra git@github.com:trilinos/thyra.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)


cd ${HOME}/software/trilinos/publicTrilinos/
GIT_SSL_NO_VERIFY=1 git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/thyra -b thyra
# push to github
git push github-thyra thyra:master
