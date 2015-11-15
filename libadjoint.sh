#!/bin/sh -ue
#
# Preparation:
#   Install git-hg <https://github.com/cosmin/git-hg> and make sure that the
#   ./bin/ directory is in the path.
#   $ cd ~/software/libadjoint/
#   $ git-hg clone ssh://hg@bitbucket.org/dolfin-adjoint/libadjoint source
#   $ cd source/
#   $ git remote add github git@github.com:live-clones/libadjoint.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/libadjoint/source
# Pull from BitBucket.
git-hg pull
# Push to GitHub.
git push github master --tags -q
