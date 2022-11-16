from pathlib import Path
from git import Repo


for name, source_git, target_git in [
    (
        "nala",
        "https://gitlab.com/volian/nala.git",
        "git@github.com:live-clones/nala.git",
    ),
    (
        "apt",
        "https://salsa.debian.org/apt-team/apt",
        "git@github.com:live-clones/apt.git",
    ),
    (
        "eigen",
        "https://gitlab.com/libeigen/eigen.git",
        "git@github.com:live-clones/eigen.git",
    ),
    (
        "dolfin",
        "https://bitbucket.org/fenics-project/dolfin.git",
        "git@github.com:live-clones/dolfin.git",
    ),
    (
        "recalbox",
        "https://gitlab.com/recalbox/recalbox.git",
        "git@github.com:live-clones/recalbox.git",
    ),
    (
        "gmsh",
        "https://gitlab.onelab.info/gmsh/gmsh.git",
        "git@github.com:live-clones/gmsh.git",
    ),
    (
        "linitian",
        "https://salsa.debian.org/lintian/lintian.git",
        "git@github.com:live-clones/lintian.git",
    ),
    (
        "pybtex",
        "https://bitbucket.org/pybtex-devs/pybtex.git",
        "git@github.com:live-clones/pybtex.git",
    ),
    (
        "xdmf",
        "https://gitlab.kitware.com/xdmf/xdmf.git",
        "git@github.com:live-clones/xdmf.git",
    ),
    (
        "chktex",
        "https://git.savannah.gnu.org/git/chktex.git",
        "git@github.com:live-clones/chktex.git",
    ),
    (
        "blaze",
        "https://bitbucket.org/blaze-lib/blaze.git",
        "git@github.com:live-clones/blaze.git",
    ),
    (
        "scotch",
        "https://gitlab.inria.fr/scotch/scotch.git",
        "git@github.com:live-clones/scotch.git",
    ),
    (
        # Before pushing, we have to remove a file with
        # ```
        # bfg --delete-files rtttest2.rttt
        # ```
        # since it's larger than 100 MB (GitHub won't allow it).
        "moab",
        "https://bitbucket.org/fathomteam/moab.git",
        "git@github.com:live-clones/moab.git",
    ),
]:
    print(f"{name}...")
    # replace / and : by - in the first argument $1
    directory = Path.home() / "tmp" / source_git.replace("/", "-").replace(":", "-")

    if directory.exists():
        repo = Repo(directory)
    else:
        # It's currently not possible to clone with --mirror (clone all
        # branches). See <https://stackoverflow.com/q/42132676/353337>.
        repo = Repo.clone_from(
            source_git,
            directory,
            bare=True,
            mirror=True,
            recursive=True,
        )
        repo.create_remote("github", url=target_git)

    # pull from source
    print("Fetch...")
    repo.remotes["origin"].fetch()

    # push to GitHub
    print("Push...")
    repo.remotes["github"].push(mirror=True)
