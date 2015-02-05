# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/ridon/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ridon/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/ridon/prebuilt/common/bin/sysinit:system/bin/sysinit


# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/ridon/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/ridon/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/ridon/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/ridon/prebuilt/common/bin/50-ridon.sh:system/addon.d/50-ridon.sh \
    vendor/ridon/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# userinit support
PRODUCT_COPY_FILES += \
    vendor/ridon/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# ridon-specific init file
PRODUCT_COPY_FILES += \
    vendor/ridon/prebuilt/common/etc/init.local.rc:root/init.ridon.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/ridon/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/ridon/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/ridon/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Prebuilts
PRODUCT_COPY_FILES +=  \
    vendor/ridon/prebuilt/common/apps/Keude-debug.apk:system/app/Keude/Keude.apk \
    vendor/ridon/prebuilt/common/apps/Term.apk:system/app/Term/Term.apk \
    vendor/ridon/prebuilt/common/apps/lib/armeabi/libjackpal-androidterm4.so:system/app/Term/lib/arm/libjackpal-androidterm4.so


