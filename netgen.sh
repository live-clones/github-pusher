#
# Preparation:
#   $ git svn clone http://svn.code.sf.net/p/netgen-mesher/code/netgen git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:nschloe/NETGEN.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/netgen/git-svn
# Pull.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags || exit 1
