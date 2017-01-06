#!/bin/bash -ue
#

clone2git() {
  # replace / and : by - in the first argument $1
  DIR="$HOME/tmp/${1//[\/:]/-}"

  if [ ! -d "$DIR" ]; then
    git svn clone "$1" "$DIR"
    cd "$DIR" || exit 1
    git remote add github "$2"
  fi

  # pull
  git svn fetch
  git svn rebase

  # push
  # Set SSH agent variables.
  . "$HOME/.keychain/$(/bin/hostname)-sh"
  git push github master --tags -q
}

# gmsh
# clone2git \
#   "https://geuz.org/svn/gmsh/trunk" \
#   "git@github.com:live-clones/gmsh.git"

# # luatex
# # https://foundry.supelec.fr/scm/?group_id=10
# # username: anonsvn
# # password: anonsvn
# clone2git \
#   "https://foundry.supelec.fr/svn/luatex/trunk" \
#   "git@github.com:live-clones/luatex.git"

# # pnetcdf
# clone2git \
#   "https://svn.mcs.anl.gov/repos/parallel-netcdf/trunk" \
#   "git@github.com:live-clones/pnetcdf.git"

# soundtouch
clone2git \
  "http://sourceforge.net/p/soundtouch/code/HEAD/tree/trunk/" \
  "git@github.com:live-clones/soundtouch.git"
