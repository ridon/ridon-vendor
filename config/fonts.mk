FONT_PATH := vendor/ridon/prebuilt/fonts

PRODUCT_COPY_FILES := \
	vendor/ridon/config/fonts/system_fonts.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/system_fonts.xml \
	vendor/ridon/config/fonts/fonts.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/fonts.xml \
	$(FONT_PATH)/OpenSans-BoldItalic.ttf:system/fonts/OpenSans-BoldItalic.ttf \
	$(FONT_PATH)/OpenSans-Bold.ttf:system/fonts/OpenSans-Bold.ttf \
	$(FONT_PATH)/OpenSans-CondBold.ttf:system/fonts/OpenSans-CondBold.ttf \
	$(FONT_PATH)/OpenSans-CondLightItalic.ttf:system/fonts/OpenSans-CondLightItalic.ttf \
	$(FONT_PATH)/OpenSans-CondLight.ttf:system/fonts/OpenSans-CondLight.ttf \
	$(FONT_PATH)/OpenSans-ExtraBoldItalic.ttf:system/fonts/OpenSans-ExtraBoldItalic.ttf \
	$(FONT_PATH)/OpenSans-ExtraBold.ttf:system/fonts/OpenSans-ExtraBold.ttf \
	$(FONT_PATH)/OpenSans-Italic.ttf:system/fonts/OpenSans-Italic.ttf \
	$(FONT_PATH)/OpenSans-LightItalic.ttf:system/fonts/OpenSans-LightItalic.ttf \
	$(FONT_PATH)/OpenSans-Light.ttf:system/fonts/OpenSans-Light.ttf \
	$(FONT_PATH)/OpenSans-Regular.ttf:system/fonts/OpenSans-Regular.ttf \
	$(FONT_PATH)/OpenSans-SemiboldItalic.ttf:system/fonts/OpenSans-SemiboldItalic.ttf \
	$(FONT_PATH)/OpenSans-Semibold.ttf:system/fonts/OpenSans-Semibold.ttf 


