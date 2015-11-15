#!/bin/sh -ue
#
# Preparation:
#   Install git-hg <https://github.com/cosmin/git-hg> and make sure that the
#   ./bin/ directory is in the path.
#   $ cd ~/software/dolfin-adjoint/dev/
#   $ git-hg clone ssh://hg@bitbucket.org/dolfin-adjoint/dolfin-adjoint
#   $ cd dolfin-adjoint/
#   $ git remote add github git@github.com:live-clones/dolfin-adjoint.git
#

# Set SSH agent variables.
. "$HOME/.keychain/$(/bin/hostname)-sh"

cd ${HOME}/software/dolfin-adjoint/dev/dolfin-adjoint/
# Pull from BitBucket.
git-hg pull
# Push to GitHub.
git push github master --tags -q
