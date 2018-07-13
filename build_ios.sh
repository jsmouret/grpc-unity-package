#!/bin/sh
set -ex

# grpc_csharp_ext needs to be a static library
sed -i'' -e 's,add_library(grpc_csharp_ext SHARED,add_library(grpc_csharp_ext,g' grpc/CMakeLists.txt

# remove unknown warning
sed -i'' -e 's,set(C_CXX_FLAGS "${C_CXX_FLAGS} -Wno-tautological-constant-compare,#set(C_CXX_FLAGS "${C_CXX_FLAGS} -Wno-tautological-constant-compare,g' \
    grpc/third_party/boringssl/CMakeLists.txt

mkdir build.ios
cd build.ios

# The iOS toolchain seems to mess up tools search,
# so pass PERL_EXECUTABLE and GO_EXECUTABLE directly
cmake ../grpc \
    -DCMAKE_TOOLCHAIN_FILE=../ios-cmake/ios.toolchain.cmake \
    -DRUN_HAVE_POSIX_REGEX=0 \
    -DRUN_HAVE_STD_REGEX=0 \
    -DRUN_HAVE_STEADY_CLOCK=0 \
    -DPERL_EXECUTABLE=`which perl` \
    -DGO_EXECUTABLE=`which go` \
    -DCMAKE_BUILD_TYPE=Release

make -j4 grpc_csharp_ext EMBED_OPENSSL=true
