RIDON_FONTS_SOURCE_DIR := vendor/ridon/prebuilt/fonts
RIDON_FONTS_TARGET_DIR := $(TARGET_COPY_OUT_SYSTEM)/fonts


PRODUCT_COPY_FILES := \
	vendor/ridon/overlay/common/frameworks/base/data/fonts/system_fonts.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/system_fonts.xml \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-BoldItalic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-BoldItalic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-Bold.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-Bold.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-CondBold.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-CondBold.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-CondLightItalic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-CondLightItalic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-CondLight.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-CondLight.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-ExtraBoldItalic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-ExtraBoldItalic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-ExtraBold.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-ExtraBold.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-Italic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-Italic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-LightItalic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-LightItalic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-Light.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-Light.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-Regular.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-Regular.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-SemiboldItalic.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-SemiboldItalic.ttf \
	$(RIDON_FONTS_SOURCE_DIR)/OpenSans-Semibold.ttf:$(RIDON_FONTS_TARGET_DIR)/OpenSans-Semibold.ttf \


