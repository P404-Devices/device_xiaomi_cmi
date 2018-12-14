# Temporary bring-up config -->
ALLOW_MISSING_DEPENDENCIES := true

BUILD_BROKEN_PHONY_TARGETS := true
BUILD_BROKEN_DUP_RULES := true
TEMPORARY_DISABLE_PATH_RESTRICTIONS := true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS

BOARD_AVB_ENABLE := false

$(call inherit-product, device/qcom/common/minimal_config.mk)
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


###########
# Initial bring-up flags
# TODO: Delete once bring-up is complete

# Include only the absolute minimum
TARGET_MINIMUM_CONFIG := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
TARGET_HAS_LOW_RAM := true
# Enable flag to support slow emulated device
TARGET_PRESIL_SLOW_BOARD := true

TARGET_USES_AOSP := true
TARGET_USES_AOSP_FOR_AUDIO := false
TARGET_USES_QCOM_BSP := false

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

TARGET_USES_QMAA_OVERRIDE_DISPLAY := false
TARGET_USES_QMAA_OVERRIDE_AUDIO   := false
TARGET_USES_QMAA_OVERRIDE_VIDEO   := false
TARGET_USES_QMAA_OVERRIDE_CAMERA  := false
TARGET_USES_QMAA_OVERRIDE_GFX     := false
TARGET_USES_QMAA_OVERRIDE_WFD     := false

###########
#QMAA flags ends
###########

###########
# Kernel configurations
TARGET_KERNEL_VERSION := 4.14
#Enable llvm support for kernel
KERNEL_LLVM_SUPPORT := true

###########
# Target configurations

QCOM_BOARD_PLATFORMS += kona

TARGET_USES_QSSI := true

TARGET_USES_QMAA := true
###QMAA Indicator Start###

#Full QMAA HAL List
QMAA_HAL_LIST :=

#Indicator for each enabled QMAA HAL for this target. Each tech team locally verified their QMAA HAL and ensure code is updated/merged, then add their HAL module name to QMAA_ENABLED_HAL_MODULES as an QMAA enabling completion indicator
QMAA_ENABLED_HAL_MODULES :=

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

# Boot control HAL test app
PRODUCT_PACKAGES_DEBUG += bootctl

DEVICE_FRAMEWORK_MANIFEST_FILE := device/qcom/kona/framework_manifest.xml

DEVICE_MANIFEST_FILE := device/qcom/kona/manifest.xml
DEVICE_MATRIX_FILE   := device/qcom/common/compatibility_matrix.xml


# Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules

#Enable full treble flag
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
BOARD_SYSTEMSDK_VERSIONS := 28
BOARD_VNDK_VERSION := current
TARGET_MOUNT_POINTS_SYMLINKS := false
