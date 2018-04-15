#!/bin/bash
# Manually setting build as autoreconf fails
sed -i 's/png_\(sizeof\)/\1/g' examples/png2theora.c && \
./configure --prefix=/usr \
            --build="$SHED_NATIVE_TARGET" \
            --disable-static && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install
