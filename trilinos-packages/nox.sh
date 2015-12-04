#!/bin/sh -ue
#
# Preparation:
#   $ git clone https://software.sandia.gov/trilinos/repositories/source-upstream
#   $ git remote add github-nox git@github.com:trilinos/nox.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"


cd ${HOME}/software/trilinos/source-upstream/
git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/nox -b nox
# push to github
git push github-nox nox:master
