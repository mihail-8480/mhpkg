if [ "$(uname)" == "Linux" ]; then
  source "$MH_PKG_PATH/lib/pacman/cmake_linux.sh"
else
  echo You are trying to run this on a currently unsupported system!
  exit 1
fi