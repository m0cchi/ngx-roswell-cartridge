#!/bin/bash

BIN=$OPENSHIFT_ROSWELL_DIR/bin
export PATH=$OPENSHIFT_ROSWELL_DIR/bin:$PATH
export HOME=$OPENSHIFT_ROSWELL_DIR/home
export ROSWELL_HOME=$HOME

cd $OPENSHIFT_ROSWELL_DIR
mkdir temp
cd temp
wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar zxvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix=$OPENSHIFT_ROSWELL_DIR
make && make install

cd ../
git clone https://github.com/snmsts/roswell.git
cd roswell
sh bootstrap
./configure --prefix=$OPENSHIFT_ROSWELL_DIR
make && make install
ros setup
ros install sbcl-bin

cd ../
wget http://nginx.org/download/nginx-1.9.5.tar.gz
tar zxvf nginx-1.9.5.tar.gz
cd nginx-1.9.5
./configure --prefix=$OPENSHIFT_ROSWELL_DIR --without-http_rewrite_module
make
make install

cd ../../
cp nginx.conf conf/nginx.conf
sed -ie "s/        listen       80;/        listen       $OPENSHIFT_ROSWELL_NGINX_IP:$OPENSHIFT_ROSWELL_NGINX_PORT;/g" conf/nginx.conf 
sed -ie "s/            root   html;//g" conf/nginx.conf
sed -ie "s/            index  index.html index.htm;/            proxy_pass http:\/\/$OPENSHIFT_ROSWELL_HTTP_IP:$OPENSHIFT_ROSWELL_HTTP_PORT;/g" conf/nginx.conf
