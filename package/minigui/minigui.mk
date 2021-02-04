MINIGUI_SITE = https://gitlab.fmsoft.cn/VincentWei/minigui
MINIGUI_VERSION = 9ff29ccb94a3d107842e5fe7247a291569cf1aa8
MINIGUI_SITE_METHOD = git
MINIGUI_INSTALL_STAGING = YES

MINIGUI_DEPENDENCIES = jpeg libpng freetype harfbuzz

define MINIGUI_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MINIGUI_PRE_CONFIGURE_HOOKS += MINIGUI_RUN_AUTOGEN

MINIGUI_CONF_OPTS = \
    --enable-procs \
    --enable-compositing \
    --with-ttfsupport=ft2 \
    --enable-develmode \
    --disable-splash \
    --disable-videopcxvfb \
    --with-ft2-includes=$(STAGING_DIR)/usr/include/freetype2 \
    --with-hb-includes=$(STAGING_DIR)/usr/include/harfbuzz \
    --enable-virtualwindow

$(eval $(autotools-package))
