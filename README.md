# mhpkg
My personal package build system.

## Installation
```shell
git clone https://github.com/mihail-8480/mhrepo
git clone https://github.com/mihail-8480/mhpkg mhpkg.tmp
alias mhpkg=../mhpkg.tmp/bin/mhpkg 
cd mhrepo
mhpkg install mhpkg
```

## Configuation
`/usr/bin/mhpkg.d/lib/mhpkg.conf`
```conf
MH_PKG_BACKEND=pacman
```
You can change `MH_PKG_BACKEND` to your package manager if it's supported.

The currently supported package managers are: `pacman`.

## Usage
The `build`, `install` and `clean` commands have alternatives that apply to every single package in the current directory, those are: `build_all`, `install_all` and `clean_all`.

### Build
If you want to build a single package execute:
```shell
mhpkg build package
```


### Install
If you want to build and install a single package execute:
```shell
mhpkg install package
```

### Cleanup
If you want to delete the downloaded and built files for a single package execute:
```shell
mhpkg clean package
```
