#! /bin/sh

# Preparation:
#   $ GIT_SSL_NO_VERIFY=1 git clone https://software.sandia.gov/trilinos/repositories/publicTrilinos
#   $ git remote add github git@github.com:nschloe/trilinos.git

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/trilinos/dev/publicTrilinos/
GIT_SSL_NO_VERIFY=1 git pull origin master || exit 1
git push github master --tags || exit 1
