#!/bin/bash -ue

clone2git() {
  # replace / and : by - in the first argument $1
  DIR="$HOME/tmp/${1//[\/:]/-}"

  if [ ! -d "$DIR" ]; then
    git svn clone "$1" "$DIR"
    cd "$DIR" || exit 1
    git remote add github "$2"
  fi

  # pull
  cd "$DIR" || exit 1
  git svn fetch
  git svn rebase

  # push
  # Set SSH agent variables.
  . "$HOME/.keychain/$(/bin/hostname)-sh"
  git push github master --tags -q
}

# gmsh
# Some files in SVN history are too large for GitHub.
# clone2git \
#   "https://geuz.org/svn/gmsh/trunk" \
#   "git@github.com:live-clones/gmsh.git"

# luatex
# https://foundry.supelec.fr/scm/?group_id=10
# username: anonsvn
# password: anonsvn
clone2git \
  "https://foundry.supelec.fr/svn/luatex/trunk" \
  "git@github.com:live-clones/luatex.git"

# pnetcdf
clone2git \
  "https://svn.mcs.anl.gov/repos/parallel-netcdf/trunk" \
  "git@github.com:live-clones/pnetcdf.git"

# soundtouch
clone2git \
  "svn://svn.code.sf.net/p/soundtouch/code/trunk" \
  "git@github.com:live-clones/soundtouch.git"

# # texlive
# # Cannot allocate memory: zlib (uncompress): buffer error: Decompression of
# # svndiff data failed at /usr/share/perl5/Git/SVN/Ra.pm line 300.
# clone2git \
#   "svn://tug.org/texlive/trunk" \
#   "git@github.com:live-clones/texlive.git"
