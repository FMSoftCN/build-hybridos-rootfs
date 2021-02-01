HICAIRO_SITE = https://gitlab.fmsoft.cn/hybridos/hicairo
HICAIRO_VERSION = 42caea0337112f89ebe94a3455c8c3a88160f2ea
HICAIRO_SITE_METHOD = git
HICAIRO_INSTALL_STAGING = YES

HICAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman minigui

define HICAIRO_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
HICAIRO_PRE_CONFIGURE_HOOKS += HICAIRO_RUN_AUTOGEN

HICAIRO_CONF_OPTS = \
	--enable-drm=no \
	--enable-glesv3=no \
	--enable-egl=no \
    --enable-glx=no \
	--enable-interpreter=no

$(eval $(autotools-package))
