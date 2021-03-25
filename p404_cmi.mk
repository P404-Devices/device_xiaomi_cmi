#
# Copyright (C) 2020 Project 404
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
#

# Include 404 common configuration
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_GAPPS_ARCH := arm64

# Inherit device configuration
$(call inherit-product, device/xiaomi/cmi/common64.mk)

# Inherit common 404 configuration
$(call inherit-product, vendor/404/configs/common.mk)

$(call inherit-product, vendor/google/pixel/config.mk)
$(call inherit-product, vendor/google/gms/config.mk)

# Override build properties
PRODUCT_NAME := p404_cmi
PRODUCT_DEVICE := cmi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 10 Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DISC="redfin-user 11 RQ1A.210205.004 7038034 release-keys"

BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ1A.210205.004/7038034:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
