$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/hwgra/hwgra-vendor.mk)

PRODUCT_PACKAGE_OVERLAYS += \
	device/huawei/hwgra/overlay

#Dalvik & memory
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

#Lights
PRODUCT_PACKAGES += lights.hi3635

#Audio
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libaudioroute \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo


# FM RADIO
PRODUCT_PACKAGES += \
    FMRadio

# GELLO
PRODUCT_PACKAGES += \
    Gello

#?
PRODUCT_PACKAGES += \
	flp.default

PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	com.nxp.nfc.nq \
	nfc_nci.pn54x.default \
	NQNfcNci \
	nqnfcee_access.xml \
	nqnfcse_access.xml \
	Tag

#WIFI
PRODUCT_PACKAGES += \
	libwpa_client \
	wpa_supplicant \
	hostapd \
	wificond \
	wifilogd 

#HWC
PRODUCT_PACKAGES += \
	hwcomposer.hi3635


#Power HAL
PRODUCT_PACKAGES += \
    power.hi3635

#GPS
#Somehow CM looks for this file with another name
#I'l keep the stock ones there too.
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vendor/system/lib64/hw/gps47531.default.so:system/lib64/hw/gps.hi3635.so

#Camera
PRODUCT_PACKAGES += \
    Snap  

# FM RADIO quick hack to copy renamed files, does cm looks for default?
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/system/lib/hw/fm.bcm.hi3635.so:system/lib/hw/fm.bcm.default.so \
    $(LOCAL_PATH)/vendor/system/lib64/hw/fm.bcm.hi3635.so:system/lib64/hw/fm.bcm.default.so

#Camera
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vendor/system/lib/libhwui.so:system/lib/libshim_hwui.so \
	$(LOCAL_PATH)/vendor/system/lib64/libhwui.so:system/lib64/libshim_hwui.so \
	$(LOCAL_PATH)/vendor/system/vendor/lib64/egl/libGLES_mali.so:system/vendor/lib64/libGLES_mali.so \
	$(LOCAL_PATH)/vendor/system/vendor/lib/egl/libGLES_mali.so:system/vendor/lib/libGLES_mali.so \
	$(LOCAL_PATH)/vendor/system/lib/libmedia.so:system/lib/libshim_media.so \
	$(LOCAL_PATH)/vendor/system/lib64/libmedia.so:system/lib64/libshim_media.so \
	$(LOCAL_PATH)/vendor/system/lib/libcamera_client.so:system/lib/libshim_camera_client.so \
	$(LOCAL_PATH)/vendor/system/lib64/libcamera_client.so:system/lib64/libshim_camera_client.so


# MEDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs_dts_audio.xml:system/etc/media_codecs_dts_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \

# AUDIO
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml


#Bluetooth Missing xml files after build
#That's probably not the propper way to do it!
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#Audio config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

#The built kernel
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

#This will be used as /etc/recovery.fstab only for twrp
PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# NFC
PRODUCT_COPY_FILES += \
frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
$(LOCAL_PATH)/nfc/libnfc-nxp_grace.conf:system/etc/libnfc-nxp.conf \
$(LOCAL_PATH)/nfc/libnfc-brcm_grace.conf:system/etc/libnfc-brcm.conf \

#I'm sick of that don't want to copy all manually but they aren't device specific anyway
#Most of them could be copied from the build system.
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/permissions/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(LOCAL_PATH)/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	$(LOCAL_PATH)/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	$(LOCAL_PATH)/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	$(LOCAL_PATH)/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	$(LOCAL_PATH)/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	$(LOCAL_PATH)/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	$(LOCAL_PATH)/permissions/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	$(LOCAL_PATH)/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	$(LOCAL_PATH)/permissions/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
	$(LOCAL_PATH)/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(LOCAL_PATH)/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(LOCAL_PATH)/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(LOCAL_PATH)/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	$(LOCAL_PATH)/permissions/platform.xml:system/etc/permissions/platform.xml



#Ramdisk
PRODUCT_PACKAGES += \
    custom.init.mods.rc \
    custom.init.usb.rc \
    init.hi3635.power.rc \
    init.hi3635.rc \
    init.recovery.hi3635.rc \
    ueventd.hi3635.rc \
    vendor.init.5844.rc \
    vendor.init.audio.rc \
    vendor.init.balong_modem.rc \
    vendor.init.connectivity.bcm4334.rc \
    vendor.init.connectivity.gps.rc \
    vendor.init.connectivity.rc \
    vendor.init.device.rc \
    vendor.init.extmodem.rc \
    vendor.init.hi3635.rc \
    vendor.init.hisi.rc \
    vendor.init.manufacture.rc \
    vendor.init.performance.rc \
    vendor.init.platform.rc \
    vendor.init.post-fs-data.rc \
    vendor.init.protocol.rc \
    vendor.init.tee.rc 

#Some files for the boot ramdisk
BOOT_RAMDISK_SRC = $(LOCAL_PATH)/ramdisk6.0
BOOT_RAMDISK_DST = root
PRODUCT_COPY_FILES += \
$(BOOT_RAMDISK_SRC)/fstab.hi3635:$(BOOT_RAMDISK_DST)/fstab.hi3635 \
$(BOOT_RAMDISK_SRC)/sbin/teecd:$(BOOT_RAMDISK_DST)/sbin/teecd \
$(BOOT_RAMDISK_SRC)/sbin/e2fsck_s:$(BOOT_RAMDISK_DST)/sbin/e2fsck_s \
$(BOOT_RAMDISK_SRC)/sbin/emmc_partation:$(BOOT_RAMDISK_DST)/sbin/emmc_partation \
$(BOOT_RAMDISK_SRC)/sbin/hdbd:$(BOOT_RAMDISK_DST)/sbin/hdbd \
$(BOOT_RAMDISK_SRC)/sbin/kmsgcat:$(BOOT_RAMDISK_DST)/sbin/kmsgcat \
$(BOOT_RAMDISK_SRC)/sbin/logctl_service:$(BOOT_RAMDISK_DST)/sbin/logctl_service \
$(BOOT_RAMDISK_SRC)/sbin/ntfs-3gd:$(BOOT_RAMDISK_DST)/sbin/ntfs-3gd \
$(BOOT_RAMDISK_SRC)/sbin/oeminfo_nvm_server:$(BOOT_RAMDISK_DST)/sbin/oeminfo_nvm_server \
$(BOOT_RAMDISK_SRC)/sbin/hw_ueventd:$(BOOT_RAMDISK_DST)/sbin/hw_ueventd
#$(BOOT_RAMDISK_SRC)/sbin/volisnotd:$(BOOT_RAMDISK_DST)/sbin/volisnotd \
#$(BOOT_RAMDISK_SRC)/sbin/check_root:$(BOOT_RAMDISK_DST)/sbin/check_root \

#$(call inherit-product, build/target/product/full.mk) #we don't want to build emulator stuff


PRODUCT_DEVICE:=hwgra
PRODUCT_NAME:=full_hwgra
PRODUCT_BRAND:=HUAWEI
PRODUCT_MODEL:=HUAWEI GRA-L09
PRODUCT_MANUFACTURER:=HUAWEI
