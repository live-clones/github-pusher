#!/bin/sh -ue
#
# Preparation:
#   $ git clone --mirror git://git.code.sf.net/p/pgfplots/code pgfplots-code
#   $ cd pgfplots-code
#   $ git remote set-url --push origin git@github.com:live-clones/pgfplots.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/pgfplots/bare-source
# Pull from sourceforge.
git fetch -p -q origin
# Push to GitHub.
git push --mirror -q
