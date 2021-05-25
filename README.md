# mhpkg
My personal package build system.

## Installation
```shell
git clone https://github.com/mihail-8480/mhpkg
cd mhpkg/bin
./mhpkg install mhpkg
```

## Configuration
If you want to change how `mhpkg` behaves you can edit the file:
`/usr/bin/mhpkg.d/lib/mhpkg.conf`
## Usage

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
