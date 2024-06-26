cmake_minimum_required(VERSION 3.4)

project(gunit_test C CXX)

if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE "Debug")
endif()

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED TRUE)
set_property (GLOBAL PROPERTY USE_FOLDERS ON)

if (MSVC)
  # 如果是MSVC, 则需要设置运行时库,
  # * Release使用MT
  # * Debug使用MTd
  set (CMAKE_CXX_FLAGS_RELEASE "/MT")
  set (CMAKE_CXX_FLAGS_DEBUG   "/MTd")
endif()

find_package(GTest PATHS ${GOOGLE_TEST_PACKAGE} NO_DEFAULT_PATH REQUIRED)

include_directories(
  "/home/jayson/apps/google_test/include/"
)

add_executable(gunit_test
  gunit_test.cc
)

target_link_libraries(gunit_test GTest::gtest GTest::gtest_main)