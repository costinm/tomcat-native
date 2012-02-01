#!/bin/sh

# Small script to get a recent openssl, with npn support
# Will run configure and build_libs to generate the .s files



SSL=openssl-1.0.1-beta2.tar.gz
mkdir -p deps
if [ ! -f deps/$SSL ] ; then
  curl http://openssl.org/source/$SSL -o deps/$SSL
fi 
if [ ! -d deps/src/openssl ] ; then
  mkdir -p deps/src/openssl 
  (cd deps/src/openssl; tar  -xvz --strip-components=1 -f ../../$SSL)
fi
if [ ! -f deps/src/openssl/Makefile ] ; then
  (cd deps/src/openssl; ./config )
fi 

(cd deps/src/openssl; make build_libs )

  
  
  
  
 
