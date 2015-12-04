#!/bin/sh -ue
#
# Preparation:
#   $ git clone https://software.sandia.gov/trilinos/repositories/source-upstream
#   $ git remote add github-epetra git@github.com:trilinos/epetra.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "${HOME}/software/trilinos/source-upstream/" || exit 1
git pull origin master -q
# extract all epetra commits into branch epetra
git subtree split -P packages/epetra -b epetra
# push to github
git push github-epetra epetra:master
