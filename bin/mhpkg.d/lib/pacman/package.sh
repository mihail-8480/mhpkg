source "$MH_PKG_PATH/lib/generic.sh"

setup_package() {
  pkgname=${1}
  pkgdesc=${2}
  pkgver=${3}
  depends=()
  license=()
  pkgrel=0
  epoch=1
}

add_dependency() {
  depends+=(${1})
}

add_license() {
  license+=(${1})
}

build_using_cmake_and_git() {
  source "$MH_PKG_PATH/lib/pacman/cmake.sh"
}

copy_git_files() {
  source "$MH_PKG_PATH/lib/pacman/copy.sh"
}


set_copy_destination() {
  copy_destination=${1}
}

set_copy_source() {
  copy_source=${1}
}