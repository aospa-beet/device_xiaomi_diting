#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/etc/camera/diting*_motiontuning.xml)
            sed -i 's/xml=version/xml\ version/g' "${2}"
            ;;
        vendor/etc/camera/pureView_parameter.xml)
            sed -i "s/=\([0-9]\+\)>/=\"\1\">/g" "${2}"
            ;;
        vendor/lib64/hw/audio.primary.taro.so | vendor/lib64/hw/displayfeature.default.so)
            "${PATCHELF}" --replace-needed "libstagefright_foundation.so" "libstagefright_foundation-v33.so" "${2}"
            ;;
        vendor/bin/hw/vendor.qti.hardware.display.composer-service)
            "${PATCHELF}" --remove-needed "libutils.so" "${2}"
            "${PATCHELF}" --add-needed "libutils-v32.so" "${2}"
            "${PATCHELF}" --add-needed "libutils-shim.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=diting
export DEVICE_COMMON=sm8450-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
