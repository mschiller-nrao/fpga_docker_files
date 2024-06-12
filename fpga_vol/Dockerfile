FROM gcr.io/hdl-containers/sim/scipy:latest

ARG DOCKER_USER=ci
ARG DOCKER_USER_UID=1000 #deliberately chosen to allign with gitlab-runner UID which should make file permissions easier
ARG DOCKER_USER_GID=1000 #deliberately chosen to allign with gitlab-runner UID which should make file permissions easier

ENV XLNX_INSTALL_LOCATION=/tools/Xilinx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update\
    && dpkg --add-architecture i386\
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
		tofrodos \
		iproute2 \
		gawk \
		xvfb \
		git \
		make \
                nano \
		net-tools \
		libncurses5-dev \
		update-inetd \
		zlib1g-dev:i386 \
		libssl-dev \
		flex \
		bison \
		libselinux1 \
		gnupg \
		wget \
		diffstat \
		chrpath \
		socat \
		xterm \
		autoconf \
		libtool \
                libudev-dev \
		libtool-bin \
		libtinfo5 \
		sudo \
                python3-full \
		tar \
		unzip \
		texinfo \
		zlib1g-dev \
		gcc-multilib \
		build-essential \
		libsdl1.2-dev \
		libglib2.0-dev \
		dialog \
		screen \
		pax \
		gzip \
		python3-gi \
		less \
		lsb-release \
		fakeroot \
		libgtk2.0-0 \
		libgtk2.0-dev \
		openssh-client \
		cpio \
		rsync \
		xorg \
		expect \
		dos2unix \
		google-perftools \
		default-jre \
                libxft2 \
                libxft2:i386 \ 
                lib32ncurses6 \
                libxtst6:i386 \
                libxtst6 \
		locales \
    && apt-get clean
RUN pip3 uninstall -y vunit-hdl
RUN pip3 install scipy
RUN pip3 install tk
RUN pip3 install wheel
RUN git clone https://github.com/mschiller-nrao/vcst.git\ 
    && cd vcst \
    && pip3 install .
RUN pip3 install cocotbext-axi
COPY locale.gen /etc/locale.gen
RUN /usr/sbin/locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -m -G sudo $DOCKER_USER
RUN echo "%sudo  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER $DOCKER_USER
#ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4:/usr/lib/x86_64-linux-gnu/libudev.so.1
COPY bash_aliases.sh /home/ci/.bash_aliases

# The user will need to volume mount tools at /tools
# tools should have this structure to the settings64.sh
# /tools/Xilinx/Vivado/2023.2/settings64.sh
COPY start_fpga_vol.sh /opt
ENTRYPOINT ["/opt/start_fpga_vol.sh"]

