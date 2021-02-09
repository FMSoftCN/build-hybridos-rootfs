MINIGUI_RES_SITE = https://gitlab.fmsoft.cn/VincentWei/minigui-res
MINIGUI_RES_VERSION = 06eed999e64bf3eed696dedd923c8a9c2d9d33bc
MINIGUI_RES_SITE_METHOD = git
MINIGUI_RES_INSTALL_STAGING = YES

MINIGUI_RES_DEPENDENCIES = jpeg libpng

define MINIGUI_RES_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MINIGUI_RES_PRE_CONFIGURE_HOOKS += MINIGUI_RES_RUN_AUTOGEN

define MINIGUI_RES_INSTALL_FONT
	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts
	$(INSTALL) -d $(TARGET_DIR)/usr/share/mime
    $(INSTALL) -c -m 644 $(MINIGUI_RES_PKGDIR)/SourceHanSansCN-Regular.otf \
        $(TARGET_DIR)/usr/share/fonts
    $(INSTALL) -c -m 644 $(MINIGUI_RES_PKGDIR)/mime.cache \
        $(TARGET_DIR)/usr/share/mime
endef
MINIGUI_RES_POST_INSTALL_TARGET_HOOKS += MINIGUI_RES_INSTALL_FONT

$(eval $(autotools-package))
