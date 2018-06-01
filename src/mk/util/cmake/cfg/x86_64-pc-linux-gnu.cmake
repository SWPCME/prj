# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
# set processor
#set(CMAKE_SYSTEM_PROCESSOR x86_64)
# this one not so much
#SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
# SET(CMAKE_C_COMPILER /usr/bin/x86_64-pc-linux-gnu-gcc)
# SET(CMAKE_CXX_COMPILER /usr/bin/x86_64-pc-linux-gnu-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH / ${PRJ_CMAKE_FIND_ROOT_PATH})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
