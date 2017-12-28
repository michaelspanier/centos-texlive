# see https://hub.docker.com/r/camilstaps/texlive/~/dockerfile/
LABEL maintainer="spanier.michael@gmail.com"
FROM centos:7

COPY texlive.profile /

RUN PACKAGES="wget perl perl-Digest-MD5 make" \
	&& yum update -y \
	&& yum install -y $PACKAGES \
	&& wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz |\
		tar xz \
	&& cd install-tl-* \
	&& ./install-tl -profile /texlive.profile
	
# Cleanup
	rm -rf install-tl-*
