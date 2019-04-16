FROM lsiobase/ubuntu:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="HurricaneHrndz"

RUN \
 echo "**** install deps ****" && \
 apt-get update && \
 apt-get install -qy --no-install-recommends \
	ca-certificates \
	fuse \
	gawk \
	libfuse2 \
	libx11-dev \
	libxfixes3 \
	libxml2 \
	libxrandr2 \
	openbox \
	pulseaudio \
	x11-apps \
	x11-xserver-utils \
	xfonts-base \
	xorgxrdp \
	xrdp \
	xserver-xorg-core \
	xutils \
	zlib1g && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3389
VOLUME /config
