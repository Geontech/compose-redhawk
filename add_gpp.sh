#!/bin/bash
#==================================================================================================
#! @file      add_gpp.sh
#! @author    Geon Technologies (geon.tech)
#! @copyright 2022 Geon Technologies, LLC. All rights reserved.
#! @brief     A convenience shell script for adding a GPP to a composed REDHAWK
#==================================================================================================
source .env
docker run --rm -d \
    -e DOMAINNAME=${DOMAIN_NAME} \
    -e OMNISERVICEIP=$HOSTNAME \
    -e NODENAME=MyGPP2 \
    --network host \
    --name docker_gpp_2 \
    geontech/redhawk-cluster-gpp:${RH_VERSION}
