#!/bin/bash

WORK_DIR=`dirname $0`
WORK_DIR=`realpath $WORK_DIR`
JARS=`find $WORK_DIR/third_party -name '*.jar'`

VERSION=opentsdb-2.3.1-bin
BUILD_DIR=/tmp/opentsdb/$VERSION
if test -n "$BUILD_DIR"; then
    rm -rf $BUILD_DIR
fi
mkdir -p $BUILD_DIR/lib

for jar in $JARS; do
    cp $jar $BUILD_DIR/lib
done

cp $WORK_DIR/tsdb-*.jar $BUILD_DIR/lib
cp -R $WORK_DIR/staticroot $BUILD_DIR/
cp $WORK_DIR/opentsdb $BUILD_DIR/

cd `dirname $BUILD_DIR`; tar czvf $VERSION.tar.gz $VERSION
mv `dirname $BUILD_DIR`/$VERSION.tar.gz $WORK_DIR
