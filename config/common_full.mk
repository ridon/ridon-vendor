# Inherit common CM stuff
$(call inherit-product, vendor/ridon/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AllAudio.mk

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Include CM audio files
include vendor/ridon/config/cm_audio.mk

# Fonts
include vendor/ridon/config/fonts.mk

ifeq ($(USE_OPENGL_RENDERER),true)
PRODUCT_PACKAGES += \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam
endif
