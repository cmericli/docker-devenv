# Dockerfile for Ubuntu 14.04 base with development tools & utils
FROM ubuntu:14.04
MAINTAINER Cetin Mericli cetin.mericli@gmail.com

# nvidia-docker uses this label to find which docker volume to mount 
# for exposing the host NVidia drivers
# not necessary if inheriting from nvidia/cuda images

LABEL com.nvidia.volumes.needed="nvidia_driver"
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# setup environment
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --fix-missing --no-install-recommends \
	module-init-tools \
	binutils \
	wget \
	vim \
	screen \
	nano \
	git \
	mercurial \
	bash-completion \
	ipython \
	aptitude \
	htop \
	mesa-utils \
	mlocate \
	gdb \
	locate \
	htop \
	linux-tools-common \
	usbutils \
	xterm \
	iperf \
	google-perftools \
    && apt-get dist-upgrade -y \
	&& rm -rf /var/lib/apt/lists/* 
RUN updatedb


#ENV QT_GRAPHICSSYSTEM="native"

ARG CUSTOM_UID=1000
ENV CUSTOM_UID ${CUSTOM_UID}
RUN echo $CUSTOM_UID
RUN adduser -u $CUSTOM_UID --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV HOME /home/dev
WORKDIR ${HOME}
USER dev

ADD vimrc ${HOME}/.vimrc
ADD screenrc ${HOME}/.screenrc

RUN sed -i -- 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
RUN /bin/bash -c "echo 'exec >/dev/tty 2>/dev/tty </dev/tty' >> ~/.bashrc"
