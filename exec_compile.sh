#!/bin/bash
# -*- coding : utf-8 -*-

source ~/script/bash/color_print.sh

path="$(cd $(dirname $0) && pwd)"

if [ -d "build" ]; then
  cd $path/build
  rm -rf ./build
fi

cmake -B $path/build                                              \
      -G "Ninja"                                                  \
      -DCMAKE_BUILD_TYPES=Debug                                   \
      -DGOOGLE_TEST_PACKAGE=/home/jayson/apps/google_test/        \
      -S $path

cmake --build $path/build

# cmake --install $path/build                       \
#       --config debug