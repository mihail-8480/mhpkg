pkgrel=0
epoch=1
arch=("$(uname -m)")
license=('MIT')
makedepends=('cmake' 'gcc' 'make' 'git')
md5sums=('SKIP')
if [ -z "$MH_GIT_REPO" ]; then
  export MH_GIT_REPO=$pkgname
fi
url="https://$MH_GIT_SERVER/$MH_GIT_USERNAME/$MH_GIT_REPO"
source=("git://$MH_GIT_SERVER/$MH_GIT_USERNAME/$MH_GIT_REPO.git")


build() {
    cd "$srcdir/$pkgname" || exit 1
    cmake -B . \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C .
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    DESTDIR="$pkgdir" cmake --install .
}

