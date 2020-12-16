### INHERIT FROM MONTBLANC
include device/samsung/montblanc-common/BoardConfigPlatform.mk
include vendor/samsung/golden/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/golden

PRODUCT_PLATFORM := montblanc

TARGET_OTA_ASSERT_DEVICE := golden,GT-I8190
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/hardware/include

### KERNEL
ifeq ($(WITH_MAGISK),true)
  TARGET_KERNEL_CONFIG := montblanc-golden_magisk_defconfig
else
  TARGET_KERNEL_CONFIG := montblanc-golden_defconfig
endif

### PARTITIONS
# /proc/partitions shows the size in 1024-byte blocks
BOARD_BOOTIMAGE_PARTITION_SIZE := 57671680 # 56 MB
BOARD_DTBOIMG_PARTITION_SIZE := 8388608 # 8 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67633152 # 66 MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600 # 614 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5976883200 # 5 GB
BOARD_VENDORIMAGE_PARTITION_SIZE := 1153433600 # 1 GB
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 650117120 # 634 MB

# Reserve space for data encryption (119126622208 - 20480)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119126601728

# blockdev --getbsz /dev/block/sda
BOARD_FLASH_BLOCK_SIZE := 4096

### DISPLAY
TARGET_SCREEN_DENSITY := 560

### SYSTEM PROPS
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

### VENDOR SECURITY PATCH DATE
VENDOR_SECURITY_PATCH := 2020-11-01

### VENDOR PROPS
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
