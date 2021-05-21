#!/bin/sh
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

export MH_PKG_SOURCE="$MH_PKG_PATH/lib/$MH_PKG_BACKEND/package.sh"