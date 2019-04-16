# docker-baseimage-gui
FROM lsiobase/ubuntu:amd64-bionic
MAINTAINER Carlos Hernandez <carlos@techbyte.ca>

#########################################
##              ARGUMENTS              ##
#########################################
ARG DEBIAN_FRONTEND=noninteractive
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="HurricaneHrndz"

#########################################
##         INSTALL DEPENDENCIES        ##
#########################################
RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get install -qy --no-install-recommends \
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
	zlib1g \
 && apt-get clean -y \
 && apt-get autoremove -y \
 && rm -rf /tmp/* /var/tmp/* \
 && rm -rf /var/lib/apt/lists/*

COPY root /
VOLUME [ "/config" ]
EXPOSE 3389
ENTRYPOINT ["/init"]
