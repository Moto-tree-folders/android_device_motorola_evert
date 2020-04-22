#!/bin/bash
#
# Copyright (C) 2018-2019 The LineageOS Project
# Copyright (C) 2020 Paranoid Android

AOSPA_ROOT="$MY_DIR"/../../..
>>>>>>> d790298 (evert: Paranoid Android xD)

export DEVICE=evert
export DEVICE_COMMON=sdm660-common
export VENDOR=motorola

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

# Load ZAF configs from vendor
ZAF_CORE="$BLOB_ROOT"/vendor/lib/libzaf_core.so
sed -i "s|/system/etc/zaf|/vendor/etc/zaf|g" "$ZAF_CORE"

# Add uhid group for fingerprint service
FP_SERVICE_RC="$BLOB_ROOT"/vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service.rc
sed -i "s/input/uhid input/" "$FP_SERVICE_RC"
