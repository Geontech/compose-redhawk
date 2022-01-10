#!/bin/bash
#==================================================================================================
#! @file      init_sdrroot.sh
#! @author    Geon Technologies (geon.tech)
#! @copyright 2022 Geon Technologies, LLC. All rights reserved.
#! @brief     A shell script to initialize the SDRROOT with default content
#==================================================================================================
source .env
docker run --rm \
    -v redhawk_sdrroot:/root/sdr \
    --name redhawk_sdrroot_init_1 \
    geontech/redhawk-development:${RH_VERSION} \
    /bin/bash -c "cp -rf /var/redhawk/sdr/* /root/sdr/ && chown -R redhawk:redhawk /root/sdr && chmod -R 775 /root/sdr"
