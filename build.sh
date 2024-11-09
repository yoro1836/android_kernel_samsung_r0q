#!/bin/bash

echo "The script will assume that the toolchains is in the .. folder"
echo "Might make the script check for toolchains existance and boot image create later"

export PATH=$(realpath ../prebuilts/gas/linux-x86):$(realpath ../prebuilts-master/clang/host/linux-x86/clang-r416183b/bin):$(realpath ../prebuilts/build-tools/path/linux-x86):$PATH

export LLVM=1
export LLVM_IAS=1
export ARCH=arm64
export CC=clang
export VARIANTS=gki
export MSM_ARCH=waipio
export CROSS_COMPILE=aarch64-linux-gnu-
export ANDROID_MAJOR_VERSION=s
export PLATFORM_VERSION=12

make -j$(nproc --all) O=out bruh-waipio-gki_defconfig
make -j$(nproc --all) O=out Image
