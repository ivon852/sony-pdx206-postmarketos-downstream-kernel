#!/bin/bash

mkdir out

GCC_PATH=/home/bbn/LineageOS/LineageOS/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
CLANG_PATH=/home/bbn/LineageOS/LineageOS/prebuilts/clang/host/linux-x86/clang-r383902/bin

BUILD_CROSS_COMPILE=${GCC_PATH}/aarch64-linux-android-
CLANG_TRIPLE=aarch64-linux-android-

DEFCONFIG=pdx203-bbn_defconfig

# export KBUILD_DIFFCONFIG=pdx203_diffconfig
export PATH=${CLANG_PATH}:${PATH}

make -j56 -C $(pwd) O=$(pwd)/out ARCH=arm64 \
    CC=clang CLANG_TRIPLE=${CLANG_TRIPLE} \
    CROSS_COMPILE=$BUILD_CROSS_COMPILE $DEFCONFIG

make -j56 -C $(pwd) O=$(pwd)/out ARCH=arm64 \
    CC=clang CLANG_TRIPLE=${CLANG_TRIPLE} \
    CROSS_COMPILE=$BUILD_CROSS_COMPILE 2>&1 | tee build.txt
