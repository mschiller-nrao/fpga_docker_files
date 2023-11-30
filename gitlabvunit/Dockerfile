FROM ghdl/vunit:llvm-master
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential automake autoconf flex check llvm-dev pkg-config zlib1g-dev libdw-dev libffi-dev libzstd-dev git
RUN cd /tmp
RUN cd /tmp;git clone https://github.com/nickg/nvc.git;cd nvc;./autogen.sh;mkdir build && cd build;../configure;make;make install
RUN python3 -m pip install pytest --progress-bar off
RUN python3 -m pip install numpy --progress-bar off
RUN cd /tmp;git clone --recurse-sub\modules https://github.com/VUnit/vunit.git; cd vunit; pip3 install . 
