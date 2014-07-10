#
# Preparation:
#   $ git clone --mirror git://git.code.sf.net/p/pgfplots/code pgfplots-code
#   $ cd pgfplots-code
#   $ git remote set-url --push origin git@github.com:nschloe/pgfplots.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/pgfplots/bare-source
# Pull from sourceforge.
git fetch -p origin || exit 1
# Push to GitHub.
git push --mirror -q || exit 1
