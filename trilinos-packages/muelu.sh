#!/bin/sh -ue
#
# Preparation:
#   $ git clone https://software.sandia.gov/trilinos/repositories/source-upstream
#   $ git remote add github-muelu git@github.com:trilinos/muelu.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"


cd "${HOME}/software/trilinos/source-upstream/" || exit 1
git pull origin master -q
# extract all NOX commits into branch nox
git subtree split -P packages/muelu -b muelu
# push to github
git push github-muelu muelu:master
