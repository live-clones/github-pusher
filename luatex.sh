#
# https://foundry.supelec.fr/scm/?group_id=10
#
# Preparation:
#   $ git svn clone https://foundry.supelec.fr/svn/luatex/trunk
#   $ git remote add github git@github.com:nschloe/luatex.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/luatex/git-svn
# Pull from wherever.
git svn fetch || exit 1
git svn rebase || exit 1
# Push to GitHub.
git push github master --tags -q || exit 1
