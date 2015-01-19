#!/bin/sh -ue
#
# Preparation:
#   $ git svn clone https://svn.mcs.anl.gov/repos/parallel-netcdf/trunk
#   $ git remote add github git@github.com:nschloe/pnetcdf.git
#

# Set SSH agent variables.
eval $(cat $HOME/.ssh/agent/info)

cd ${HOME}/software/pnetcdf/source-git
# Pull from wherever.
git svn fetch
git svn rebase
# Push to GitHub.
git push github master --tags -q
