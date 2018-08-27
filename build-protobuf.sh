#!/bin/bash
PROTOBUF_ROOT=$1
if [ ! $PROTOBUF_ROOT ]
then
    echo need protobuf root path
    exit -1
fi

PROTOBUF_ROOT_BASENAME=$(basename $PROTOBUF_ROOT)
BUILD_DIR=$(pwd)/${PROTOBUF_ROOT_BASENAME//[ -\.]/_} # convert protobuf-3.6.1 to protobuf_3_6_1

if [ ! "${BUILD_DIR/ /}" = "$BUILD_DIR" ]
then
    echo current folder path contains white space.
    exit -1
fi

echo delete old build dir: $BUILD_DIR
rm -rf $BUILD_DIR

cd $PROTOBUF_ROOT
make clean
./configure CFLAGS="-fPIC" CXXFLAGS="-fPIC" --prefix=${BUILD_DIR}/usr/local/lib --enable-shared=no
make -j8
make install # this command will install protobuf to ${BUILD_DIR}/usr/local/lib

mv ${BUILD_DIR}/usr/local/lib/* ${BUILD_DIR}
rm -rf ${BUILD_DIR}/usr
