################################################################################
#
# hiRsvg
#
################################################################################

LIBRSVG_SITE = https://gitlab.fmsoft.cn/hybridos/hirsvg
LIBRSVG_VERSION = 47d2f4f9fcafb0f64b45ddd711c9e5f752f6fc8e
LIBRSVG_SITE_METHOD = git
LIBRSVG_INSTALL_STAGING = YES

LIBRSVG_DEPENDENCIES = hicairo libcroco libglib2 libxml2 pango

define MINIGUI_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh "test"
endef
LIBRSVG_PRE_CONFIGURE_HOOKS += MINIGUI_RUN_AUTOGEN

LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --disable-introspection --enable-minigui-backend

HOST_LIBRSVG_CONF_OPTS = --disable-introspection --enable-minigui-backend=no
HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango

$(eval $(autotools-package))
$(eval $(host-autotools-package))
