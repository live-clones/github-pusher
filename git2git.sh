#!/bin/bash -u
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

# eigen
clone2git \
  "https://gitlab.com/libeigen/eigen.git" \
  "git@github.com:live-clones/eigen.git"

# dolfin
clone2git \
  "https://bitbucket.org/fenics-project/dolfin.git" \
  "git@github.com:live-clones/dolfin.git"

# recalbox
clone2git \
  "https://gitlab.com/recalbox/recalbox.git" \
  "git@github.com:live-clones/recalbox.git"

# dolfin-adjoint
# This <https://github.com/dolfin-adjoint/pyadjoint> seems like a better option
# clone2git \
#   "https://bitbucket.org/dolfin-adjoint/dolfin-adjoint.git" \
#   "git@github.com:live-clones/dolfin-adjoint.git"

# gmsh
clone2git \
  "https://gitlab.onelab.info/gmsh/gmsh.git" \
  "git@github.com:live-clones/gmsh.git"

# # HDF5
# It's on gh now. https://github.com/HDFGroup
# clone2git \
#   "https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git" \
#   "git@github.com:live-clones/hdf5.git"

# launchpad
# don't clone that since the checkout is SO big (8 GB)
# clone2git \
#   "https://git.launchpad.net/launchpad" \
#   "git@github.com:live-clones/launchpad.git"

# libadjoint
# This <https://github.com/dolfin-adjoint/pyadjoint> seems like a better option
# clone2git \
#   "https://bitbucket.org/dolfin-adjoint/libadjoint.git" \
#   "git@github.com:live-clones/libadjoint.git"

# lintian
clone2git \
  "https://salsa.debian.org/lintian/lintian.git" \
  "git@github.com:live-clones/lintian.git"

# # MOAB
# # At least one file in Git history is larger than 100MB.
clone2git \
  "git@bitbucket.org:fathomteam/moab.git" \
  "git@github.com:live-clones/moab.git"

# Netgen
# 2022-11-06: This is now at <https://github.com/live-clones/netgen>
# clone2git \
#   "https://git.code.sf.net/p/netgen-mesher/git" \
#   "git@github.com:live-clones/netgen.git"

# Pybtex
clone2git \
  "https://bitbucket.org/pybtex-devs/pybtex.git" \
  "git@github.com:live-clones/pybtex.git"

# Xdmf
clone2git \
  "https://gitlab.kitware.com/xdmf/xdmf.git" \
  "git@github.com:live-clones/xdmf.git"

# ChkTeX
clone2git \
  "https://git.savannah.gnu.org/git/chktex.git" \
  "git@github.com:live-clones/chktex.git"

clone2git \
  "https://bitbucket.org/blaze-lib/blaze.git" \
  "git@github.com:live-clones/blaze.git"

clone2git \
  "https://gitlab.inria.fr/scotch/scotch.git" \
  "git@github.com:live-clones/scotch.git"

# XeTeX
# There is already a semi-official mirror of the TeX Live project at https://github.com/tex-live/xetex
# clone2git \
#   "https://git.code.sf.net/p/xetex/code" \
#   "git@github.com:live-clones/xetex.git"

# Next: Mercurial/hg
# For this to work, git-remote-hg <https://github.com/felipec/git-remote-hg>
# needs to be in the path
# Example crontab line:
#
# 0 * * * * export PATH=/home/pi/rcs/git-remote-hg:$PATH; cd /home/pi/rcs/github-pusher/ && ./git2git.sh && ./svn2git.sh

# # blas++
# clone2git \
#   "hg::https://bitbucket.org/icl/blaspp" \
#   "git@github.com:live-clones/blaspp.git"
