source "$MH_PKG_PATH/lib/generic.sh"

setup_package() {
  pkgname=${1}
  pkgdesc=${2}
  pkgver=${3}
  depends=()
}

add_dependency() {
  depends+=(${1})
}

build_using_cmake_and_git() {
  source "$MH_PKG_PATH/lib/pacman/cmake.sh"
}
