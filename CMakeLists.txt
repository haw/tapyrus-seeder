cmake_minimum_required(VERSION 3.12)
project(seeder)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++11 -O3 -g0 -march=native")


include_directories(.)
include_directories(/usr/local/Cellar/boost/1.67.0_1/include/)
include_directories(/usr/local/Cellar/openssl/1.0.2p/include/)
include_directories(/usr/local/opt/openssl/include/)
#include_directories(/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/)
find_library(openssl REQUIRED)
#target_link_libraries(crypto)

add_executable(dnsseed
        bitcoin.cpp
        bitcoin.h
        compat.h
        db.cpp
        db.h
        dns.c
        dns.h
        main.cpp
        netbase.cpp
        netbase.h
        protocol.cpp
        protocol.h
        serialize.h
        strlcpy.h
        uint256.h
        util.cpp
        util.h)

target_link_libraries(dnsseed m)
target_link_libraries(dnsseed crypto)