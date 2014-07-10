#
# Preparation:
#   $ git svn clone svn://svn.openttd.org git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:nschloe/openttd.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/openttd/git-svn
# Pull.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags -q || exit 1
