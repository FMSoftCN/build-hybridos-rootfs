MINIGUI_SITE = https://gitlab.fmsoft.cn/VincentWei/minigui
MINIGUI_VERSION = 2fe23fa95b06b950b19273afcdc7ec50f2035727
MINIGUI_SITE_METHOD = git
MINIGUI_INSTALL_STAGING = YES

MINIGUI_DEPENDENCIES = jpeg libpng freetype harfbuzz libdrm pixman

define MINIGUI_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MINIGUI_PRE_CONFIGURE_HOOKS += MINIGUI_RUN_AUTOGEN

MINIGUI_CONF_OPTS = \
    --enable-procs \
    --enable-compositing \
    --with-ttfsupport=ft2 \
    --enable-develmode \
    --enable-videodrm \
    --disable-splash \
    --disable-videopcxvfb \
    --with-ft2-includes=$(STAGING_DIR)/usr/include/freetype2 \
    --with-hb-includes=$(STAGING_DIR)/usr/include/harfbuzz \
    --enable-virtualwindow

ifeq ($(BR2_TARGET_NAME_r818),y)
	MINIGUI_CONF_OPTS += --with-targetname=r818
endif

$(eval $(autotools-package))
