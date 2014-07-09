#
# Preparation:
#   $ git svn clone https://geuz.org/svn/gmsh/trunk git-svn
#   $ cd git-svn
#   $ git remote add github git@github.com:nschloe/gmsh.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/gmsh/git-svn
# Pull.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags || exit 1
