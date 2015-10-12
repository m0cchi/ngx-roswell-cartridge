#!/bin/bash

BIN=$OPENSHIFT_SBCL_DIR/bin
export PATH=$OPENSHIFT_SBCL_DIR/bin:$PATH
export HOME=$OPENSHIFT_SBCL_DIR/home
export ROSWELL_HOME=$HOME

cd $OPENSHIFT_SBCL_DIR
mkdir temp
wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar zxvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix=$OPENSHIFT_SBCL_DIR
make && make install

cd ../
git clone https://github.com/snmsts/roswell.git
cd roswell
sh bootstrap
./configure --prefix=$OPENSHIFT_SBCL_DIR
make && make install
ros setup
ros install sbcl-bin
