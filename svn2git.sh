#!/bin/bash -u

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
  # Supporess messages about added files
  git svn fetch > /dev/null
  # Suppress messages like
  # > Current branch master is up to date.
  git svn rebase > /dev/null

  # push
  # Set SSH agent variables.
  . "$HOME/.keychain/$(/bin/hostname)-sh"
  git push github master --tags -q
}

# luatex
# https://foundry.supelec.fr/scm/?group_id=10
# username: anonsvn
# password: anonsvn
# This is now at https://github.com/TeX-Live/luatex
# clone2git \
#   "https://serveur-svn.lri.fr/svn/modhel/luatex/trunk/" \
#   "git@github.com:live-clones/luatex.git"

# pnetcdf
# This is now at <https://github.com/Parallel-NetCDF/PnetCDF>
# clone2git \
#   "https://svn.mcs.anl.gov/repos/parallel-netcdf/trunk" \
#   "git@github.com:live-clones/pnetcdf.git"

# soundtouch
# clone2git \
#   "svn://svn.code.sf.net/p/soundtouch/code/trunk" \
#   "git@github.com:live-clones/soundtouch.git"

# docutils
clone2git \
  "svn://svn.code.sf.net/p/docutils/code/trunk" \
  "git@github.com:live-clones/docutils.git"

# # texlive
# # Cannot allocate memory: zlib (uncompress): buffer error: Decompression of
# # svndiff data failed at /usr/share/perl5/Git/SVN/Ra.pm line 300.
# clone2git \
#   "svn://tug.org/texlive/trunk" \
#   "git@github.com:live-clones/texlive.git"
