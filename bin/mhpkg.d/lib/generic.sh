mh_git_version() {
  curl -s https://raw.githubusercontent.com/mihail-8480/mh/master/CMakeLists.txt | grep "VERSION " | sed -n 2p | xargs | cut  -d' ' -f2
}

mh_version() {
  mh_git_version || echo 0.0.0
}

setup_git() {
  export MH_GIT_SERVER=${1}
  export MH_GIT_USERNAME=${2}
  export MH_GIT_REPO=${3}
}
