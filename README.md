# prj # {#prj_readme}

## describe
The target of this project is project management for all platform,
it has these attribute:
- platform: unix, windows.
- compiler: gcc.
- compiler speedup utilities: distcc, ccache.
- version control system: git.
- cross-compile: x86_64-pc-linux-gnu, x86_64-w64-mingw32, i686-elf.
- doxygen: The docuemnt generator.
- code generation tools: autogen.
- language: c/cxx, java, python.
- swig: Wrap the c/cxx code for any other script language.
- python wrapper: cython.

## directory
- src: The source of this project.
- doc: The docuemnt of this project.

## dependence
Core:
- autotools
- autogen
- cmake
- coreutils
- rsync

Option:
- binutils
- ccache
- diffutils
- distcc
- gcc
- git
- java
- patch
- python
- swig

## release
- v0.1: The basic support for c/c++, swig, java, python, cmake, autoconf.
- v0.2: To add lisp script instead of the shell and makefile.
