# config.mk
#
# Product-specific compile-time definitions.
#

BOARD_SYSTEMSDK_VERSIONS:= $(SHIPPING_API_LEVEL)

TARGET_BOARD_PLATFORM := kona
TARGET_BOOTLOADER_BOARD_NAME := kona

BOARD_USES_QCOM_HARDWARE := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_NO_KERNEL := false

-include $(QCPATH)/common/kona/BoardConfigVendor.mk

USE_OPENGL_RENDERER := true

#Generate DTBO image
BOARD_KERNEL_SEPARATED_DTBO := true

# Partitions (Boot)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Partition (Cache)
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (DTBO)
BOARD_DTBOIMG_PARTITION_SIZE := 33554432

# Partition (Metadata)
BOARD_USES_METADATA_PARTITION := true

# Partition (ODM)
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm

# Partition (Product)
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product

# Partition (Recovery)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728

# Partiton (Super)
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9126801408 # ( BOARD_SUPER_PARTITION_SIZE - 4MB )
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# Partition (Userdata)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114898743296

# Partition (Vendor)
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Reserve space
ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
else
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 30720000
endif

BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/audio_apr.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_pdr.ko \
    $(KERNEL_MODULES_OUT)/audio_q6_notifier.ko \
    $(KERNEL_MODULES_OUT)/audio_adsp_loader.ko \
    $(KERNEL_MODULES_OUT)/audio_q6.ko \
    $(KERNEL_MODULES_OUT)/audio_usf.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_wcd.ko \
    $(KERNEL_MODULES_OUT)/audio_pinctrl_lpi.ko \
    $(KERNEL_MODULES_OUT)/audio_swr.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd_core.ko \
    $(KERNEL_MODULES_OUT)/audio_swr_ctrl.ko \
    $(KERNEL_MODULES_OUT)/audio_wsa881x.ko \
    $(KERNEL_MODULES_OUT)/audio_platform.ko \
    $(KERNEL_MODULES_OUT)/audio_hdmi.ko \
    $(KERNEL_MODULES_OUT)/audio_stub.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd9xxx.ko \
    $(KERNEL_MODULES_OUT)/audio_mbhc.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd938x.ko \
    $(KERNEL_MODULES_OUT)/audio_wcd938x_slave.ko \
    $(KERNEL_MODULES_OUT)/audio_bolero_cdc.ko \
    $(KERNEL_MODULES_OUT)/audio_wsa_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_va_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_rx_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_tx_macro.ko \
    $(KERNEL_MODULES_OUT)/audio_native.ko \
    $(KERNEL_MODULES_OUT)/audio_machine_kona.ko \
    $(KERNEL_MODULES_OUT)/audio_snd_event.ko \
    $(KERNEL_MODULES_OUT)/wil6210.ko \
    $(KERNEL_MODULES_OUT)/msm_11ad_proxy.ko \
    $(KERNEL_MODULES_OUT)/gspca_main.ko \
    $(KERNEL_MODULES_OUT)/lcd.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/mpq-adapter.ko \
    $(KERNEL_MODULES_OUT)/mpq-dmx-hw-plugin.ko \

# check for for userdebug and eng build variants and install the appropriate modules
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    ifeq (,$(findstring perf_defconfig, $(KERNEL_DEFCONFIG)))
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/atomic64_test.ko
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/lkdtm.ko
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/locktorture.ko
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/rcutorture.ko
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/test_user_copy.ko
	    BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/torture.ko
    endif
endif

BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_IMAGE_NAME := Image

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8250

# Prebuilt kernel
TARGET_PREBUILT_KERNEL := device/xiaomi/umi/prebuilt/Image
TARGET_FORCE_PREBUILT_KERNEL := true

# Prebuilt DTB
TARGET_PREBUILT_DTB := device/xiaomi/umi/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=

# Prebuilt DTBO
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/umi/prebuilt/dtbo.img

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

#Disable appended dtb.
TARGET_COMPILE_WITH_MSM_KERNEL := true

#Enable dtb in boot image and boot image header version 2 support.
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Audio policy
USE_XML_AUDIO_POLICY_CONF := 1

# Audio features
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/umi/bluetooth/include

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

ifeq ($(HOST_OS),linux)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_PIC := true
      ifneq ($(TARGET_BUILD_VARIANT),user)
        # Retain classes.dex in APK's for non-user builds
        DEX_PREOPT_DEFAULT := nostripping
      endif
    endif
endif

#Add non-hlos files to ota packages
ADD_RADIO_FILES := true

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

#flag for qspm compilation
TARGET_USES_QSPM := true

#-----------------------------------------------------------------
# wlan specific
#-----------------------------------------------------------------
ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
include device/qcom/wlan/kona/BoardConfigWlan.mk
endif

#################################################################################
# This is the End of BoardConfig.mk file.
# Now, Pickup other split Board.mk files:
#################################################################################
# TODO: Relocate the system Board.mk files pickup into qssi lunch, once it is up.
-include $(sort $(wildcard vendor/qcom/defs/board-defs/system/*.mk))
-include $(sort $(wildcard vendor/qcom/defs/board-defs/vendor/*.mk))
#################################################################################

BUILD_BROKEN_DUP_RULES := true

BUILD_BROKEN_NINJA_USES_ENV_VARS := SDCLANG_AE_CONFIG SDCLANG_CONFIG SDCLANG_SA_ENABLED
# We need this to invoke make to build the kernel, etc.
BUILD_BROKEN_NINJA_USES_ENV_VARS += TEMPORARY_DISABLE_PATH_RESTRICTIONS
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/umi/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/xiaomi/umi/sepolicy/public
BOARD_SEPOLICY_DIRS += device/xiaomi/umi/sepolicy/vendor

# Inherit proprietary blobs
-include vendor/xiaomi/umi/BoardConfigVendor.mk
