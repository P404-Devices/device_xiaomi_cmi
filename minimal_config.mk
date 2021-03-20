#
#  Copyright (c) 2018, The Linux Foundation. All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#       * Redistributions of source code must retain the above copyright
#         notice, this list of conditions and the following disclaimer.
#       * Redistributions in binary form must reproduce the above
#         copyright notice, this list of conditions and the following
#         disclaimer in the documentation and/or other materials provided
#         with the distribution.
#       * Neither the name of The Linux Foundation nor the names of its
#         contributors may be used to endorse or promote products derived
#         from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
#  ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
#  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
#  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
#  IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Minimal configuration definition for basic boot to shell

#INIT
INIT := init.qcom.rc
INIT += init.qcom.sh
INIT += init.qcom.class_core.sh
INIT += init.class_main.sh
INIT += init.qcom.early_boot.sh
INIT += init.qcom.post_boot.sh
INIT += init.target.rc
INIT += vold.fstab
INIT += fstab.qcom
INIT += fstab.qti
INIT += init.recovery.qcom.rc
INIT += init.qcom.factory.rc
INIT += init.qcom.composition_type.sh
INIT += init.qti.ims.sh
INIT += init.qcom.coex.sh
INIT += init.qcom.sdio.sh
INIT += init.qcom.ril.path.sh
INIT += init.qcom.usb.rc
INIT += init.msm.usb.configfs.rc
INIT += init.qcom.usb.sh
INIT += usf_post_boot.sh
INIT += init.qcom.efs.sync.sh
INIT += ueventd.qcom.rc
INIT += qca6234-service.sh
INIT += ssr_setup
INIT += enable_swap.sh
INIT += init.mdm.sh
INIT += init.qcom.sensors.sh
INIT += init.qcom.crashdata.sh
INIT += init.qcom.vendor.rc
INIT += init.target.vendor.rc
INIT += init.qti.fm.sh
PRODUCT_PACKAGES += $(INIT)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/device/overlay \
    $(LOCAL_PATH)/product/overlay \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-404

# Properties
TARGET_SYSTEM_PROP += device/xiaomi/umi/system.prop
TARGET_VENDOR_PROP += device/xiaomi/umi/vendor.prop
