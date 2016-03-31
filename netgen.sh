#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git://git.code.sf.net/p/netgen-mesher/git bare-source
#   $ cd bare-source
#   $ git remote set-url --push origin git@github.com:live-clones/netgen.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd "$HOME/software/netgen/bare-source" || exit 1
# Pull from bitbucket.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
