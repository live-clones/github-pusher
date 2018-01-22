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

# recalbox
clone2git \
  "https://gitlab.com/recalbox/recalbox.git" \
  "git@github.com:live-clones/recalbox.git"

# dolfin-adjoint
clone2git \
  "https://bitbucket.org/dolfin-adjoint/dolfin-adjoint.git" \
  "git@github.com:live-clones/dolfin-adjoint.git"

# gmsh
clone2git \
  "https://gitlab.onelab.info/gmsh/gmsh.git" \
  "git@github.com:live-clones/gmsh.git"

# HDF5
clone2git \
  "https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git" \
  "git@github.com:live-clones/hdf5.git"

# launchpad
clone2git \
  "https://git.launchpad.net/launchpad" \
  "git@github.com:live-clones/launchpad.git"

# libadjoint
clone2git \
  "https://bitbucket.org/dolfin-adjoint/libadjoint.git" \
  "git@github.com:live-clones/libadjoint.git"

# lintian
clone2git \
  "https://anonscm.debian.org/git/lintian/lintian.git" \
  "git@github.com:live-clones/lintian.git"

# # MOAB
# # At least one file in Git history is larger than 100MB.
# clone2git \
#   "git@bitbucket.org:fathomteam/moab.git" \
#   "git@github.com:live-clones/moab.git"

# Netgen
clone2git \
  "https://git.code.sf.net/p/netgen-mesher/git" \
  "git@github.com:live-clones/netgen.git"

# OpenTTD
clone2git \
  "https://git.openttd.org/openttd/trunk.git/" \
  "git@github.com:live-clones/openttd.git"

# Pgfplots
clone2git \
  "https://git.code.sf.net/p/pgfplots/code" \
  "git@github.com:live-clones/pgfplots.git"

# Pybtex
clone2git \
  "https://bitbucket.org/pybtex-devs/pybtex.git" \
  "git@github.com:live-clones/pybtex.git"

# Xdmf
clone2git \
  "https://gitlab.kitware.com/xdmf/xdmf.git" \
  "git@github.com:live-clones/xdmf.git"

# Next: Mercurial/hg
# For this to work, git-remote-hg <https://github.com/felipec/git-remote-hg>
# needs to be in the path
# Example crontab line:
#
# 0 * * * * export PATH=/home/pi/rcs/git-remote-hg:$PATH; cd /home/pi/rcs/github-pusher/ && ./git2git.sh && ./svn2git.sh
