MINIGUI_RES_SITE = https://gitlab.fmsoft.cn/VincentWei/minigui-res
MINIGUI_RES_VERSION = 33f15c0aae6fa072e6a2e66d1920b4e9aa9474f1
MINIGUI_RES_SITE_METHOD = git
MINIGUI_RES_INSTALL_STAGING = YES

MINIGUI_RES_DEPENDENCIES = jpeg libpng

define MINIGUI_RES_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MINIGUI_RES_PRE_CONFIGURE_HOOKS += MINIGUI_RES_RUN_AUTOGEN

define MINIGUI_RES_INSTALL_RES
	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts
	$(INSTALL) -d $(TARGET_DIR)/usr/share/mime
    $(INSTALL) -c -m 644 $(MINIGUI_RES_PKGDIR)/mime.cache \
        $(TARGET_DIR)/usr/share/mime
endef
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_RES

MINIGUI_RES_INSTALL_FONT = n

# Chinese Fonts
ifeq ($(BR2_FONTS_CHINESE_IEKIE_SANS_SERIF_HEI_MEDIUM),y)
define MINIGUI_RES_INSTALL_CHINESE_IEKIE_SANS_SERIF_HEI_MEDIUM
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-chinese-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_CHINESE_IEKIE_SANS_SERIF_HEI_MEDIUM
endif

ifeq ($(R2_FONTS_CHINESE_ADOBE_SOURCE_HAN_SANS_REGULAR),y)
define MINIGUI_RES_INSTALL_CHINESE_ADOBE_SOURCE_HAN_SANS_REGULAR
    $(INSTALL) -c -m 644 $(@D)/adobe-fonts/SourceHanSans-Regular.ttc \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_CHINESE_ADOBE_SOURCE_HAN_SANS_REGULAR
endif

# English Fonts
ifeq ($(BR2_FONTS_ENGLISH_IEKIE_SANS_SERIF_HEI_MEDIUM),y)
define MINIGUI_RES_INSTALL_ENGLISH_IEKIE_SANS_SERIF_HEI_MEDIUM
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_ENGLISH_IEKIE_SANS_SERIF_HEI_MEDIUM
endif

ifeq ($(BR2_FONTS_ENGLISH_IEKIE_SANS_SERIF_HEI_LIGHT),y)
define MINIGUI_RES_INSTALL_ENGLISH_IEKIE_SANS_SERIF_HEI_LIGHT
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-light.ttf \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_ENGLISH_IEKIE_SANS_SERIF_HEI_LIGHT
endif

ifneq ($(MINIGUI_RES_INSTALL_FONT),y)
define MINIGUI_RES_INSTALL_DEFAULT_FONTS
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-chinese-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-light.ttf \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_DEFAULT_FONTS
endif


$(eval $(autotools-package))
