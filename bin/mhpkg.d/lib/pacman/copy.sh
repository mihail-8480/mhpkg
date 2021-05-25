arch=("any")
md5sums=('SKIP')
if [ -z "$MH_GIT_REPO" ]; then
  export MH_GIT_REPO=$pkgname
fi
url="https://$MH_GIT_SERVER/$MH_GIT_USERNAME/$MH_GIT_REPO"
source=("git://$MH_GIT_SERVER/$MH_GIT_USERNAME/$MH_GIT_REPO.git")

package() {
  cd "$srcdir/$MH_GIT_REPO" || exit 1
  mkdir -p $pkgdir/$copy_destination
  cp -r "$srcdir/$MH_GIT_REPO/$copy_source/*" "$pkgdir/$copy_destination"
}

