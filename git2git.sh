#!/bin/bash -ue
#
clone2git() {
  # replace / and : by - in the first argument $1
  DIR="$HOME/tmp/${1//[\/:]/-}"

  if [ ! -d "$DIR" ]; then
    git clone --mirror "$1" "$DIR"
    cd "$DIR" || exit 1
    git remote set-url --push origin "$2"
  fi

  cd "$DIR" || exit 1

  # Pull from bitbucket.
  git fetch -p -q origin

  # Push to GitHub.
  # Set SSH agent variables.
  . "$HOME/.keychain/$(/bin/hostname)-sh"
  git push --mirror -q
}

# dolfin-adjoint
clone2git \
  "https://nschloe@bitbucket.org/dolfin-adjoint/dolfin-adjoint.git" \
  "git@github.com:live-clones/dolfin-adjoint.git"

# HDF5
clone2git \
  "https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git" \
  "git@github.com:live-clones/hdf5.git"

# # MOAB
# clone2git \
#   "git@bitbucket.org:fathomteam/moab.git" \
#   "git@github.com:live-clones/moab.git"

# Netgen
clone2git \
  "git://git.code.sf.net/p/netgen-mesher/git" \
  "git@github.com:live-clones/netgen.git"

# OpenTTD
clone2git \
  "http://git.openttd.org/openttd/trunk.git/" \
  "git@github.com:live-clones/openttd.git"

# # Pgfplots
# clone2git \
#   "git://git.code.sf.net/p/pgfplots/code" \
#   "git@github.com:live-clones/pgfplots.git"

# Xdmf
clone2git \
  "git://public.kitware.com/Xdmf.git" \
  "git@github.com:live-clones/xdmf.git"
