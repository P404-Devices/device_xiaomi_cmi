# Temporary bring-up config -->
ALLOW_MISSING_DEPENDENCIES := true

BUILD_BROKEN_PHONY_TARGETS := true
BUILD_BROKEN_DUP_RULES := true
TEMPORARY_DISABLE_PATH_RESTRICTIONS := true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS

# Enable AVB 2.0
BOARD_AVB_ENABLE := true

# Enable chain partition for system, to facilitate system-only OTA in Treble.
BOARD_AVB_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_SYSTEM_ROLLBACK_INDEX := 0
BOARD_AVB_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_QCOM_FM := false
TARGET_DISABLE_PERF_OPTIMIATIONS := true
TARGET_DISABLE_DISPLAY := false

$(call inherit-product, device/qcom/common/common64.mk)
# Temporary bring-up config <--

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Temporary bring-up config -->
PRODUCT_SUPPORTS_VERITY := false
# Temporary bring-up config <--

###########
# Target naming
PRODUCT_NAME := kona
PRODUCT_DEVICE := kona
PRODUCT_BRAND := qti
PRODUCT_MODEL := Kona for arm64


TARGET_USES_AOSP := true
TARGET_USES_AOSP_FOR_AUDIO := false
TARGET_USES_QCOM_BSP := false

# system prop for Bluetooth SOC type
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=hastings

###########
#QMAA flags starts
###########
#QMAA global flag for modular architecture
#true means QMAA is enabled for system
#false means QMAA is disabled for system

TARGET_USES_QMAA := true

#QMAA tech team flag to override global QMAA per tech team
#true means overriding global QMAA for this tech area
#false means using global, no override

TARGET_USES_QMAA_OVERRIDE_DISPLAY := true
TARGET_USES_QMAA_OVERRIDE_AUDIO   := true
TARGET_USES_QMAA_OVERRIDE_VIDEO   := true
TARGET_USES_QMAA_OVERRIDE_CAMERA  := false
TARGET_USES_QMAA_OVERRIDE_GFX     := false
TARGET_USES_QMAA_OVERRIDE_WFD     := false
TARGET_USES_QMAA_OVERRIDE_SENSORS := true
TARGET_USES_QMAA_OVERRIDE_DATA    := false
TARGET_USES_QMAA_OVERRIDE_VPP     := false

###########
#QMAA flags ends
###########

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

TARGET_DISABLE_QTI_VPP := true

###########
# Kernel configurations
TARGET_KERNEL_VERSION := 4.19
#Enable llvm support for kernel
KERNEL_LLVM_SUPPORT := true
#Enable sd-llvm support for kernel
KERNEL_SD_LLVM_SUPPORT := true

###########
# Target configurations

QCOM_BOARD_PLATFORMS += kona

# VIDC configuration
MSM_VIDC_TARGET_LIST += kona

TARGET_USES_QSSI := true

###QMAA Indicator Start###

#Full QMAA HAL List
QMAA_HAL_LIST :=

#Indicator for each enabled QMAA HAL for this target. Each tech team locally verified their QMAA HAL and ensure code is updated/merged, then add their HAL module name to QMAA_ENABLED_HAL_MODULES as an QMAA enabling completion indicator
QMAA_ENABLED_HAL_MODULES :=
QMAA_ENABLED_HAL_MODULES += sensors

###QMAA Indicator End###

#Default vendor image configuration
ENABLE_VENDOR_IMAGE := true

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

BOARD_FRP_PARTITION_NAME := frp

# Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

-include hardware/qcom/display/config/kona.mk

PRODUCT_PACKAGES += fs_config_files
PRODUCT_PACKAGES += gpio-keys.kl

# A/B related packages
PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    bootctrl.kona \
    brillo_update_payload \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# QRTR related packages
PRODUCT_PACKAGES += qrtr-ns
PRODUCT_PACKAGES += qrtr-lookup
PRODUCT_PACKAGES += libqrtr

# Boot control HAL test app
PRODUCT_PACKAGES_DEBUG += bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
  bootctrl.kona \
  librecovery_updater_msm \
  libz \
  libcutils

PRODUCT_PACKAGES += \
  update_engine_sideload

DEVICE_FRAMEWORK_MANIFEST_FILE := device/qcom/kona/framework_manifest.xml

DEVICE_MANIFEST_FILE := device/qcom/kona/manifest.xml
DEVICE_MATRIX_FILE   := device/qcom/common/compatibility_matrix.xml

#Audio DLKM
AUDIO_DLKM := audio_apr.ko
AUDIO_DLKM += audio_q6_pdr.ko
AUDIO_DLKM += audio_q6_notifier.ko
AUDIO_DLKM += audio_adsp_loader.ko
AUDIO_DLKM += audio_q6.ko
AUDIO_DLKM += audio_usf.ko
AUDIO_DLKM += audio_pinctrl_wcd.ko
AUDIO_DLKM += audio_swr.ko
AUDIO_DLKM += audio_wcd_core.ko
AUDIO_DLKM += audio_swr_ctrl.ko
AUDIO_DLKM += audio_wsa881x.ko
AUDIO_DLKM += audio_platform.ko
AUDIO_DLKM += audio_hdmi.ko
AUDIO_DLKM += audio_stub.ko
AUDIO_DLKM += audio_wcd9xxx.ko
AUDIO_DLKM += audio_mbhc.ko
AUDIO_DLKM += audio_native.ko
AUDIO_DLKM += audio_wcd938x.ko
AUDIO_DLKM += audio_wcd938x_slave.ko
AUDIO_DLKM += audio_bolero_cdc.ko
AUDIO_DLKM += audio_wsa_macro.ko
AUDIO_DLKM += audio_va_macro.ko
AUDIO_DLKM += audio_rx_macro.ko
AUDIO_DLKM += audio_tx_macro.ko
AUDIO_DLKM += audio_machine_kona.ko
AUDIO_DLKM += audio_snd_event.ko

PRODUCT_PACKAGES += $(AUDIO_DLKM)

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += device/qcom/kona/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules

# Audio configuration file
-include $(TOPDIR)vendor/qcom/opensource/audio-hal/primary-hal/configs/kona/kona.mk

USE_CUSTOM_AUDIO_POLICY := 0
USE_LIB_PROCESS_GROUP := true

# Video configuration file
-include $(TOPDIR)hardware/qcom/media/conf_files/kona/kona.mk

#Enable full treble flag
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
BOARD_SYSTEMSDK_VERSIONS := 28
BOARD_VNDK_VERSION := current
TARGET_MOUNT_POINTS_SYMLINKS := false

KMGK_USE_QTI_SERVICE := true

#Enable KEYMASTER 4.0
ENABLE_KM_4_0 := true

# Sensor conf files
PRODUCT_COPY_FILES += \
    device/qcom/kona/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    libvolumelistener

PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += telephony-ext
PRODUCT_PACKAGES += telephony-ext

TARGET_DISABLE_DASH := true

ifneq ($(TARGET_DISABLE_DASH), true)
      PRODUCT_BOOT_JARS += qcmediaplayer
endif

#ifneq ($(strip $(QCPATH)),)
#    PRODUCT_BOOT_JARS += WfdCommon
#endif

ifneq ($(strip $(QCPATH)),)
    PRODUCT_BOOT_JARS += libprotobuf-java_mls
endif

###################################################################################
# This is the End of target.mk file.
# Now, Pickup other split product.mk files:
###################################################################################
# TODO: Relocate the system product.mk files pickup into qssi lunch, once it is up.
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/system/*.mk)
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/vendor/*.mk)
###################################################################################
