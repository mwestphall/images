#!/bin/bash -xe                                                                                                                                                             
# Script for testing docker xrootd standalone images

docker run --rm \
       --publish 1094:1094 \
       --volume $(pwd)/travis/test_file:/tmp/docker_xrootd_standalone/test_file \
       --volume $(pwd)/travis/15-travis-site-config.cfg:/etc/xrootd/config.d/15-travis-site-config.cfg \
       --volume $(pwd)/travis/40-travis-ci-lcmaps.cfg:/etc/xrootd/config.d/90-travis-ci-lcmaps.cfg \
       --name xrootd_standalone opensciencegrid/xrootd-standalone:20191216-2313 &
docker ps
sleep 2

#online_md5="$(curl -sL http://localhost:1094//test_file | md5sum | cut -d ' ' -f 1)"
#local_md5="$(md5sum $(pwd)/travis/test_file | cut -d ' ' -f 1)"
#if [ "$online_md5" != "$local_md5" ]; then
#    echo "MD5sums do not match on origin"
#    exit 1
#fi
