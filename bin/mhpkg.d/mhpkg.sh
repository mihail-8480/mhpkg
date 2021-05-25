#!/bin/sh
clean() {
  echo "Cleaning '${1}'..."
  if [ -f "${1}/package.mhpkg" ]; then
    find "${1}" ! -name 'package.mhpkg' -type f -exec rm -f {} +
    find "${1}" ! -name "$(echo "${1}" | sed 's:/*$::')" -type d -exec rm -rf {} +
    rm -rf "${1}${1}"
  else
    echo "This is not a package directory, ingoing command."
  fi
}

update_repo() {
  prev=$PWD
  cd "$MH_PKG_REPO"
  git pull
  cd "$prev"
}

check_repo() {
  if [ -d "$MH_PKG_REPO/.git" ]; then
    update_repo
    return
  else
    echo "The repository isn\'t initialized, initializing now..."
    mkdir -p "$MH_PKG_REPO"
    git clone "$MH_PKG_REPO_DEFAULT" "$MH_PKG_REPO"
  fi
}

help() {
  echo "Usage: ${0} command [package]"
  echo
  echo "The valid commands are:"
  echo "- clean [package]: Deletes all build files for a package."
  echo "- install [package]: Builds and installs a package."
  echo "- build [package]: Builds a package."
  echo "- lib: Don't do anything (declares the functions)."
  echo
}

main() {
  check_repo
  cd "$MH_PKG_REPO"
  if [ "${1}" = "clean" ]; then
    clean "${2}/"
    exit 0
  fi

  if [ "${1}" = "install" ]; then
    install "${2}"
    exit 0
  fi

  if [ "${1}" = "build" ]; then
    build "${2}"
    exit 0
  fi

  if [ "${1}" = "help" ]; then
    help
    exit 0
  fi
  echo "Nothing to do."
}