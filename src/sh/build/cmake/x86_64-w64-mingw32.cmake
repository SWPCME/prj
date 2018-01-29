# this one is important
SET(CMAKE_SYSTEM_NAME Windows)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /home/swpcme/me/usr/x86_64-w64-mingw32/bin/x86_64-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /home/swpcme/me/usr/x86_64-w64-mingw32/bin/x86_64-w64-mingw32-g++)
SET(CMAKE_Fortran_COMPILER /home/swpcme/me/usr/x86_64-w64-mingw32/bin/x86_64-w64-mingw32-gfortran)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH  /usr/include /usr/lib)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)