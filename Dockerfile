FROM ghcr.io/tttapa/docker-crosstool-ng-multiarch:master

ARG HOST_TRIPLE

WORKDIR /home/develop
RUN mkdir /home/develop/src
RUN ls -lah

RUN ct-ng ${HOST_TRIPLE}
RUN V=1 ct-ng build || { cat build.log && false; } && rm -rf .build

ENV TOOLCHAIN_PATH=/home/develop/x-tools/${HOST_TRIPLE}
ENV PATH=${TOOLCHAIN_PATH}/bin:$PATH
WORKDIR /home/develop
