TARGET_USE_VENDOR_CAMERA_EXT := true

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true

#Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Below projects/packages with LOCAL_MODULEs will be used by
# PRODUCT_PACKAGES to build LOCAL_MODULEs that are tagged with
# optional tag, which will not be available on target unless
# explicitly list here. Where project corresponds to the vars here
# in CAPs.

#ATRACE_HAL
ATRACE_HAL := android.hardware.atrace@1.0-service

#AUDIO_HAL
AUDIO_HAL += android.hardware.audio@6.0-impl
AUDIO_HAL += android.hardware.audio.effect@6.0-impl
AUDIO_HAL += android.hardware.audio.service
AUDIO_HAL += android.hardware.bluetooth.audio@2.0-impl
AUDIO_HAL += android.hardware.soundtrigger@2.3-impl
AUDIO_HAL += audio.a2dp.default
AUDIO_HAL += audio.primary.kona
AUDIO_HAL += audio.r_submix.default
AUDIO_HAL += audio.usb.default
AUDIO_HAL += libaudio-resampler
AUDIO_HAL += audio.hearing_aid.default
AUDIO_HAL += audio.bluetooth.default
AUDIO_HAL += liba2dpoffload
AUDIO_HAL += libaudiozoom
AUDIO_HAL += libbatterylistener
AUDIO_HAL += libcirrusspkrprot
AUDIO_HAL += libcomprcapture
AUDIO_HAL += libexthwplugin
AUDIO_HAL += libhdmiedid
AUDIO_HAL += libhdmipassthru
AUDIO_HAL += libqcomvoiceprocessingdescriptors
AUDIO_HAL += libqcomvisualizer
AUDIO_HAL += libqcompostprocbundle
AUDIO_HAL += libhfp
AUDIO_HAL += libsndmonitor
AUDIO_HAL += libqcomvoiceprocessing

#BLUETOOTH_HAL
BLUETOOTH_HAL += android.hardware.bluetooth.audio@2.0-impl
BLUETOOTH_HAL += audio.bluetooth.default
BLUETOOTH_HAL += libbluetooth_qti
BLUETOOTH_HAL += libbthost_if
BLUETOOTH_HAL += libldacBT_dec
BLUETOOTH_HAL += vendor.qti.hardware.bluetooth_audio@2.0.vendor
BLUETOOTH_HAL += vendor.qti.hardware.btconfigstore@1.0.vendor

#CAMERA
CAMERA += android.hardware.camera.provider@2.4-impl
CAMERA += android.hardware.camera.provider@2.4-service_64
CAMERA += libcamera2ndk_vendor
CAMERA += libgui_vendor
CAMERA += vendor.qti.hardware.camera.device@3.5.vendor
CAMERA += vendor.qti.hardware.camera.postproc@1.0.vendor
CAMERA += libstdc++.vendor

#DATA_OS
DATA_OS := librmnetctl

#DISPLAY
DISPLAY += libtinyxml

#DRM
DRM += android.hardware.drm@1.3-service.clearkey

#FASTBOOTD
FASTBOOTD += fastbootd

HIDL_WRAPPER := qti-telephony-hidl-wrapper
HIDL_WRAPPER += qti_telephony_hidl_wrapper.xml

QTI_TELEPHONY_UTILS := qti-telephony-utils
QTI_TELEPHONY_UTILS += qti_telephony_utils.xml

#HOSTAPD
HOSTAPD := hostapd

#IPACM
IPACM += ipacm
IPACM += IPACM_cfg.xml
IPACM += ipacm-diag

#LIB_XML2
LIB_XML2 := libxml2

#memtrack
LIBMEMTRACK += memtrack.kona

#LIBLIGHTS
LIBLIGHTS += lights.kona

#LIBQDMETADATA
LIBQDMETADATA := libqdMetaData

#LIBPOWER -- Add HIDL Packages
LIBPOWER += android.hardware.power@1.0-impl
LIBPOWER += android.hardware.power@1.0-service

#LLVM for RenderScript
#use qcom LLVM
$(call inherit-product-if-exists, external/llvm/llvm-select.mk)

#MM_AUDIO
MM_AUDIO += libOmxAacEnc
MM_AUDIO += libOmxAmrEnc
MM_AUDIO += libOmxEvrcEnc
MM_AUDIO += libOmxQcelp13Enc

#MM_CORE
MM_CORE += libOmxCore

#WFD
MM_WFD := libwfdaac
MM_WFD := libwfdaac_vendor

#MM_VIDEO
MM_VIDEO += libOmxVdec
MM_VIDEO += libOmxVenc
MM_VIDEO += libstagefrighthw

#NQ_NFC
NQ_NFC += com.gsma.services.nfc
NQ_NFC += libchrome.vendor
NQ_NFC += Tag
NQ_NFC += com.android.nfc_extras
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.nfc_nci=nqx.default

#Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PROTOBUF := libprotobuf-cpp-full

#STK
STK := Stk

#WPA
WPA := wpa_supplicant.conf
WPA += wpa_supplicant

#RCS
RCS := rcs_service_aidl
RCS += rcs_service_aidl.xml
RCS += rcs_service_aidl_static
RCS += rcs_service_api
RCS += rcs_service_api.xml

#IMS Extension module for Android Telephony
IMS_EXT := ims-ext-common
IMS_EXT += ims_ext_common.xml

PRODUCT_PACKAGES += $(ATRACE_HAL)
PRODUCT_PACKAGES += $(AUDIO_HAL)
PRODUCT_PACKAGES += $(BLUETOOTH_HAL)
PRODUCT_PACKAGES += $(CAMERA)
PRODUCT_PACKAGES += $(C2DCC)
PRODUCT_PACKAGES += $(RCS)
PRODUCT_PACKAGES += $(DATA_OS)
PRODUCT_PACKAGES += $(DISPLAY)
PRODUCT_PACKAGES += $(DRM)
PRODUCT_PACKAGES += $(FASTBOOTD)
PRODUCT_PACKAGES += $(HOSTAPD)
PRODUCT_PACKAGES += $(HIDL_WRAPPER)
PRODUCT_PACKAGES += $(I420CC)
PRODUCT_PACKAGES += $(INIT)
PRODUCT_PACKAGES += $(LIB_XML2)
PRODUCT_PACKAGES += $(LIBMEMTRACK)
PRODUCT_PACKAGES += $(LIBLIGHTS)
PRODUCT_PACKAGES += $(LIBAUDIOPARAM)
PRODUCT_PACKAGES += $(LIBQDMETADATA)
PRODUCT_PACKAGES += $(LIBPOWER)
PRODUCT_PACKAGES += $(MEDIA_PROFILES)
PRODUCT_PACKAGES += $(MM_AUDIO)
PRODUCT_PACKAGES += $(MM_CORE)
PRODUCT_PACKAGES += $(MM_WFD)
PRODUCT_PACKAGES += $(MM_VIDEO)
PRODUCT_PACKAGES += $(NQ_NFC)
PRODUCT_PACKAGES += $(PROTOBUF)
PRODUCT_PACKAGES += $(QTI_TELEPHONY_UTILS)
PRODUCT_PACKAGES += $(STK)
PRODUCT_PACKAGES += $(THERMAL_HAL)
PRODUCT_PACKAGES += $(WPA)
PRODUCT_PACKAGES += $(IPACM)
PRODUCT_PACKAGES += $(IMS_EXT)

# MSM updater library
PRODUCT_PACKAGES += librecovery_updater_msm

# healthd libaray expanded for mode charger
PRODUCT_PACKAGES += android.hardware.health@2.1-impl
PRODUCT_PACKAGES += android.hardware.health@2.1-service

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    device/xiaomi/umi/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

#copy codecs_xxx.xml to (TARGET_COPY_OUT_VENDOR)/etc/
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    device/xiaomi/umi/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \

PRODUCT_COPY_FILES += \
    device/xiaomi/umi/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/xiaomi/umi/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/xiaomi/umi/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml

# Copy the vulkan feature level file.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
    ro.adb.secure=1
endif

PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    vendor.usb.diag.func.name=diag

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcomsysd.enabled=1

# framework detect libs
PRODUCT_PACKAGES += libvndfwk_detect_jni.qti
PRODUCT_PACKAGES += libqti_vndfwk_detect
PRODUCT_PACKAGES += libvndfwk_detect_jni.qti.vendor
PRODUCT_PACKAGES += libqti_vndfwk_detect.vendor
