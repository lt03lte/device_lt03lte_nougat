#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from common msm8974
include device/samsung/msm8974-common/BoardConfigCommon.mk

COMMON_PATH := device/samsung/lt03lte

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := lt03lte,lt03ltexx

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Audio
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH_BCM := true

# Charging
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/lineagehw

# Display
TARGET_MSM8974_1440P_EGL_WORKAROUND := true

# Filesystem
BOARD_ROOT_EXTRA_FOLDERS := efs firmware/radio firmware/adsp firmware-modem
BOARD_ROOT_EXTRA_SYMLINKS := /data/tombstones:/tombstones

# HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml

TARGET_INIT_VENDOR_LIB := libinit.msm8974

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 maxcpus=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := lineageos_lt03lte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/lt03lte
LZMA_RAMDISK_TARGETS := recovery

# Legacy BLOB Support
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
	
TARGET_LD_SHIM_LIBS = \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshim_camera.so
	
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.samsung8974=22 \
    /system/vendor/bin/hw/rild=27 \
    /system/vendor/lib/libarcsoft_nighthawk.so=22
    
MALLOC_SVELTE := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15259648
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12828261888
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# FS
TARGET_EXFAT_DRIVER := sdfat
TARGET_KERNEL_HAVE_NTFS := true

# Pre-Optimize DEX
WITH_DEXPREOPT := true

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(COMMON_PATH)/power/power_ext.c

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# TWRP Support - Optional
ifeq ($(WITH_TWRP),true)
-include $(COMMON_PATH)/twrp.mk
endif

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# RIL
BOARD_PROVIDES_LIBRIL := true
TARGET_RIL_VARIANT := caf

# Security patch level
VENDOR_SECURITY_PATCH := 2017-04-01

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# SELinux
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy

# WiFi
BOARD_HAVE_SAMSUNG_WIFI     := true
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_OPERSTATE_PATH := "/sys/class/net/wlan0/operstate"
WPA_SUPPLICANT_USE_HIDL     := true
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/etc/wifi/bcmdhd_sta.bin nvram_path=/system/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/vendor/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/vendor/etc/wifi/nvram_net.txt"

