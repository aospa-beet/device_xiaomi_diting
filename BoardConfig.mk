# Copyright (C) 2024 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/xiaomi/diting

# Inherit from sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Include proprietary files
include vendor/xiaomi/diting/BoardConfigVendor.mk

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_diting
TARGET_RECOVERY_DEVICE_MODULES := libinit_diting

# OTA
TARGET_OTA_ASSERT_DEVICE := diting|ditingp

# Screen density
TARGET_SCREEN_DENSITY := 480
