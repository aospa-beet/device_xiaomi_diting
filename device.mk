# Copyright (C) 2024 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/diting/diting-vendor.mk)

# Firmware
$(call inherit-product-if-exists, vendor/xiaomi/firmware/diting/config.mk)

# Camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.mod_device=diting_global

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Euicc
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Kernel
KERNEL_PREBUILT_DIR := $(LOCAL_PATH)-kernel

# Overlays
PRODUCT_PACKAGES += \
    AOSPADitingFrameworksOverlay \
    DitingEuiccOverlay \
    DitingFrameworksOverlay \
    DitingNfcOverlay \
    DitingpSettingsProviderOverlay \
    DitingpWifiOverlay \
    DitingpWifiMainlineOverlay \
    DitingSettingsOverlay \
    DitingSettingsProviderOverlay \
    DitingSystemUIOverlay \
    DitingWifiOverlay \
    DitingWifiMainlineOverlay

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
