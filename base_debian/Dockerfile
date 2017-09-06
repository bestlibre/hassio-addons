#armhf:FROM arm32v7/debian:%%UPSTREAM_VERSION%%
#aarch64:FROM arm64v8/debian:%%UPSTREAM_VERSION%%

ENV ARCH %%ARCH%%

COPY qemu-arm-static /usr/bin/qemu-arm-static
COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN if [ "$ARCH" = "armhf" ]; then rm /usr/bin/qemu-aarch64-static;\
    elif [ "$ARCH" = "aarch64" ]; then rm /usr/bin/qemu-arm-static;\
    fi
