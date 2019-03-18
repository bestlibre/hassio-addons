ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

COPY qemu-arm-static /usr/bin/qemu-arm-static
COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN if [ "$BUILD_ARCH" = "armhf" -o "$BUILD_ARCH" = "armv7" ]; then rm /usr/bin/qemu-aarch64-static;\
    elif [ "$BUILD_ARCH" = "aarch64" ]; then rm /usr/bin/qemu-arm-static;\
    fi
