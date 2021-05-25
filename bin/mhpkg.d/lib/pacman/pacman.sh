#!/bin/sh
export MH_PKG_SOURCE="$MH_PKG_PATH/lib/$MH_PKG_BACKEND/package.sh"
prepare_package() {
  if [ -f "package.mhpkg" ]; then
    echo source "\$MH_PKG_SOURCE" > PKGBUILD
    cat package.mhpkg >> PKGBUILD
  else
    echo "'package.mhpkg' was not found!"
    exit 1
  fi
}

install() {
  echo "Building and installing '${1}'..."
  prev=$PWD
  cd "${1}" || exit 1
  prepare_package
  makepkg -si
  cd "$prev"
}

build() {
  echo "Building '${1}'..."
  prev=$PWD
  cd "${1}" || exit 1
  prepare_package
  makepkg -f
  cd "$prev"
}

clean() {
  echo "Cleaning '${1}'..."
  if [ -f "${1}/package.mhpkg" ]; then
    find "${1}" ! -name 'package.mhpkg' -type f -exec rm -f {} +
    find "${1}" ! -name "$(echo "${1}" | sed 's:/*$::')" -type d -exec rm -rf {} +
    rm -rf "${1}${1}"
  else
    echo "This is not a package directory, ignoring command."
  fi
}