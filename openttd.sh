#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror http://git.openttd.org/openttd/trunk.git/ bare-source
#   $ cd bare-source
#   $ git remote set-url --push origin git@github.com:live-clones/openttd.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/openttd/bare-source" || exit 1
# Pull from bitbucket.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
