#!/bin/sh -ue
#
# Preparation:
#   Install git-hg <https://github.com/cosmin/git-hg> and make sure that the
#   ./bin/ directory is in the path.
#   $ cd ~/software/dolfin-adjoint/
#   $ git-hg clone ssh://hg@bitbucket.org/dolfin-adjoint/da-applications
#   $ git remote add github git@github.com:live-clones/da-applications.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/dolfin-adjoint/da-applications/
# Pull from BitBucket.
git-hg pull
# Push to GitHub.
git push github master --tags -q
