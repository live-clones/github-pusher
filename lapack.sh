#
# Preparation:
#   $ git svn clone https://icl.cs.utk.edu/svn/lapack-dev/lapack/trunk
#   $ git remote add github git@github.com:nschloe/lapack.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/lapack/git-svn
# Pull from wherever.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags -q || exit 1
