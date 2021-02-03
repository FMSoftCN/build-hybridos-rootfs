################################################################################
#
# hiRsvg
#
################################################################################

HIRSVG_SITE = https://gitlab.fmsoft.cn/hybridos/hirsvg
HIRSVG_VERSION = 47d2f4f9fcafb0f64b45ddd711c9e5f752f6fc8e
HIRSVG_SITE_METHOD = git
HIRSVG_INSTALL_STAGING = YES

HIRSVG_DEPENDENCIES = hicairo libcroco libglib2 libxml2 pango

define MINIGUI_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh "test"
endef
HIRSVG_PRE_CONFIGURE_HOOKS += MINIGUI_RUN_AUTOGEN

HIRSVG_CONF_OPTS = --disable-introspection --disable-pixbuf-loader --enable-minigui-backend

$(eval $(autotools-package))
