#!/bin/sh
set -ex

# Need CMake 3.7.2
export PATH=${ANDROID_CMAKE_PATH}:${PATH}

mkdir build.android
cd build.android

cmake ../grpc \
    -DCMAKE_SYSTEM_NAME=Android \
    -DCMAKE_SYSTEM_VERSION=15 \
    -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a \
    -DCMAKE_ANDROID_NDK="${ANDROID_NDK_PATH}" \
    -DCMAKE_ANDROID_STL_TYPE=c++_static \
    -DRUN_HAVE_POSIX_REGEX=0 \
    -DRUN_HAVE_STD_REGEX=0 \
    -DRUN_HAVE_STEADY_CLOCK=0 \
    -DCMAKE_BUILD_TYPE=Release

make -j4 grpc_csharp_ext EMBED_OPENSSL=true
