#
# Preparation:
#   Install git-hg <https://github.com/cosmin/git-hg> and make sure that the
#   ./bin/ directory is in the path.
#   $ cd ~/software/vim/
#   $ git-hg clone https://code.google.com/p/vim/ git-hg/
#   $ cd git-hg
#   $ git remote add github git@github.com:nschloe/vim.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/vim/git-hg/
# Pull from BitBucket.
git-hg pull || exit 1
# Push to GitHub.
git push github master --tags || exit 1
