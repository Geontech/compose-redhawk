#!/bin/bash
#==================================================================================================
#! @file      start_rhide.sh
#! @author    Geon Technologies (geon.tech)
#! @copyright 2022 Geon Technologies, LLC. All rights reserved.
#! @license   GPLv3
#! @brief     A convenience shell script for starting REDHAWK IDE attached to composed REDHAWK
#==================================================================================================
source .env
script_dir=$(dirname $(realpath "$0"))
docker run --rm -d \
    -e RHUSER_ID=$(id -u) \
    -e OMNISERVICEIP=$HOSTNAME \
    -e DISPLAY=$DISPLAY \
    -v redhawk_sdrroot:/var/redhawk/sdr \
    -v $script_dir/workspace:/home/user/workspace \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -P \
    --network host \
    --name redhawk_development_1 \
    geontech/redhawk-development:${RH_VERSION}
