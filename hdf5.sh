#
# Preparation:
#   $ git svn clone https://svn.hdfgroup.uiuc.edu/hdf5/trunk/
#   $ git remote add github git@github.com:nschloe/hdf5.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/hdf5/dev/git-svn || exit 1
# Pull from wherever.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags || exit 1
