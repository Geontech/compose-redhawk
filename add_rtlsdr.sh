#!/bin/bash
#==================================================================================================
#! @file      add_rtlsdr.sh
#! @author    Geon Technologies (geon.tech)
#! @copyright 2022 Geon Technologies, LLC. All rights reserved.
#! @brief     A convenience shell script for adding an RTLSDR to a composed REDHAWK
#==================================================================================================
source .env
docker run --rm -d \
    -e DOMAINNAME=${DOMAIN_NAME} \
    -e NODENAME=MyRTLSDR \
    -e OMNISERVICEIP=$HOSTNAME \
    -v /dev/bus/usb:/dev/bus/usb \
    --privileged \
    --network host \
    --name docker_rtlsdr_1 \
    geontech/redhawk-rtl2832u:${RH_VERSION}
