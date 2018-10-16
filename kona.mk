# Enable AVB 2.0
BOARD_AVB_ENABLE := true

# Temporary bring-up config (skip dependency checking)
ALLOW_MISSING_DEPENDENCIES := true

$(call inherit-product, device/qcom/common/minimal_config.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

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
# Kernel configurations
TARGET_KERNEL_VERSION := 4.14
#Enable llvm support for kernel
KERNEL_LLVM_SUPPORT := true
KERNEL_LLVM_BIN := $(ANDROID_BUILD_TOP)/$(lastword $(sort $(wildcard prebuilts/clang/host/linux-x86/clang-4*)))/bin/clang

###########
# Target configurations

QCOM_BOARD_PLATFORMS += kona

TARGET_USES_QSSI := true

#Default vendor image configuration
ENABLE_VENDOR_IMAGE := true

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

BOARD_FRP_PARTITION_NAME := frp

# Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

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
