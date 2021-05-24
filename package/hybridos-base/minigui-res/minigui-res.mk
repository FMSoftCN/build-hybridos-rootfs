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
ifeq ($(BR2_PACKAGE_MINIGUI_RES_IEKIE_FONTS),y)
define MINIGUI_RES_INSTALL_IEKIE_FONTS
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-chinese-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-medium.ttf \
        $(TARGET_DIR)/usr/share/fonts
    $(INSTALL) -c -m 644 $(@D)/iekie-fonts/sans-serif-hei-latin-light.ttf \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_IEKIE_FONTS
endif

ifeq ($(BR2_PACKAGE_MINIGUI_RES_ADOBE_FONTS),y)
define MINIGUI_RES_INSTALL_ADOBE_FONTS
    $(INSTALL) -c -m 644 $(@D)/adobe-fonts/SourceHanSans-Regular.ttc \
        $(TARGET_DIR)/usr/share/fonts
endef
MINIGUI_RES_INSTALL_FONT = y
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_ADOBE_FONTS
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
