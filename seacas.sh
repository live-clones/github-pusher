#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git://git.code.sf.net/p/seacas/code source
#   $ cd source
#   $ git remote set-url --push origin git@github.com:live-clones/seacas.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/seacas/pristine" || exit 1
# Pull from bitbucket.
git fetch -p origin
# Push to GitHub.
git push --mirror -q
