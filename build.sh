#!/bin/bash
set -x
cd $(dirname $0)

ROOT_DIR=`pwd`  # The script file is here
BUILD_DIR=$ROOT_DIR/build
OUTPUT_DIR=$ROOT_DIR/output

build_target() {
    mkdir $OUTPUT_DIR
    mkdir $BUILD_DIR && cd $BUILD_DIR
     cmake .. \
		-D BUILD_TESTING=OFF \
		-D BUILD_DOCS=OFF \
		-D BUILD_EXAMPLES=OFF \
		-D BUILD_TESTS=OFF \
		-D OPENCL_SDK_BUILD_SAMPLES=ON \
		-D OPENCL_SDK_TEST_SAMPLES=OFF

     cmake --build ../build --target install
}

clean_build () {
		echo "clean the outputs ...."
		if [ -d $BUILD_DIR ] ; then
			rm -rf $BUILD_DIR
		fi

		if [ -d $OUTPUT_DIR ] ; then
			rm -rf $OUTPUT_DIR
		fi
}
clean_build
build_target