#!/bin/sh -ue
#
# Preparation:
#   $ git clone https://software.sandia.gov/trilinos/repositories/source-upstream
#   $ git remote add github-teuchos git@github.com:trilinos/teuchos.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"


cd ${HOME}/software/trilinos/source-upstream/
git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/teuchos -b teuchos
# push to github
git push github-teuchos teuchos:master
