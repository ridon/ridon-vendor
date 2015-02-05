SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

PRODUCT_BOOTANIMATION := vendor/ridon/prebuilt/common/bootanimation/1024.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable multithreaded dexopt by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.multithread=false

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# T-Mobile theme engine
include vendor/ridon/config/themes_common.mk
include vendor/ridon/config/base_files.mk
include vendor/ridon/config/fonts.mk
include vendor/ridon/config/packages.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/ridon/overlay/common

PRODUCT_VERSION_MAJOR = 5
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0-RC0

# Set RIDON_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef RIDON_BUILDTYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^RIDON_||g')
        RIDON_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(RIDON_BUILDTYPE)),)
    RIDON_BUILDTYPE :=
endif

ifdef RIDON_BUILDTYPE
    ifneq ($(RIDON_BUILDTYPE), SNAPSHOT)
        ifdef RIDON_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            RIDON_BUILDTYPE := EXPERIMENTAL
            # Remove leading dash from RIDON_EXTRAVERSION
            RIDON_EXTRAVERSION := $(shell echo $(RIDON_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to RIDON_EXTRAVERSION
            RIDON_EXTRAVERSION := -$(RIDON_EXTRAVERSION)
        endif
    else
        ifndef RIDON_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            RIDON_BUILDTYPE := EXPERIMENTAL
        else
            # Remove leading dash from RIDON_EXTRAVERSION
            RIDON_EXTRAVERSION := $(shell echo $(RIDON_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to RIDON_EXTRAVERSION
            RIDON_EXTRAVERSION := -$(RIDON_EXTRAVERSION)
        endif
    endif
else
    # If RIDON_BUILDTYPE is not defined, set to UNOFFICIAL
    RIDON_BUILDTYPE := UNOFFICIAL
    RIDON_EXTRAVERSION :=
endif

ifeq ($(RIDON_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        RIDON_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ifeq ($(RIDON_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        RIDON_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(RIDON_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            RIDON_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(RIDON_BUILD)
        else
            RIDON_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(RIDON_BUILD)
        endif
    endif
else
    ifeq ($(PRODUCT_VERSION_MINOR),0)
        RIDON_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(RIDON_BUILDTYPE)$(RIDON_EXTRAVERSION)-$(RIDON_BUILD)
    else
        RIDON_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(RIDON_BUILDTYPE)$(RIDON_EXTRAVERSION)-$(RIDON_BUILD)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.ridon.version=$(RIDON_VERSION) \
  ro.ridon.releasetype=$(RIDON_BUILDTYPE) \
  ro.modversion=$(RIDON_VERSION) \
  ro.ridonlegal.url=http://fixme

#-include vendor/ridon-priv/keys/keys.mk

RIDON_DISPLAY_VERSION := $(RIDON_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
  ifneq ($(RIDON_BUILDTYPE), UNOFFICIAL)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      ifneq ($(RIDON_EXTRAVERSION),)
        # Remove leading dash from RIDON_EXTRAVERSION
        RIDON_EXTRAVERSION := $(shell echo $(RIDON_EXTRAVERSION) | sed 's/-//')
        TARGET_VENDOR_RELEASE_BUILD_ID := $(RIDON_EXTRAVERSION)
      else
        TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
      endif
    else
      TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
    endif
    RIDON_DISPLAY_VERSION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)
  endif
endif
endif

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

PRODUCT_PROPERTY_OVERRIDES += \
  ro.ridon.display.version=$(RIDON_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk

#-include vendor/cyngn/product.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)

