#!/bin/sh

source /etc/profile
cd /usr/libexec
./mginit 2>&1 | tee /tmp/r.log
cd -
