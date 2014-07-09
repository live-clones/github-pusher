#
# Preparation:
#   Install git-hg <https://github.com/cosmin/git-hg> and make sure that the
#   ./bin/ directory is in the path.
#   $ cd ~/software/dolfin-adjoint/
#   $ git-hg clone ssh://hg@bitbucket.org/dolfin-adjoint/dolfin-adjoint
#   $ git remote add github git@github.com:nschloe/dolfin-adjoint.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/libadjoint/source
# Pull from BitBucket.
git-hg pull || exit 1
# Push to GitHub.
git push github master --tags || exit 1
