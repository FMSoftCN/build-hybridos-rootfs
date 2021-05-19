HICAIRO_SITE = https://gitlab.fmsoft.cn/hybridos/hicairo
HICAIRO_VERSION = b6f9cf3d92733738025542969779f401f87617f7
HICAIRO_SITE_METHOD = git
HICAIRO_INSTALL_STAGING = YES


define HICAIRO_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
HICAIRO_PRE_CONFIGURE_HOOKS += HICAIRO_RUN_AUTOGEN


# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k_cf),y)
HICAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
HICAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DHICAIRO_NO_MUTEX=1"
endif

# cairo can use C++11 atomics when available, so we need to link with
# libatomic for the architectures who need libatomic.
ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
HICAIRO_CONF_ENV += LIBS="-latomic"
endif

HICAIRO_CONF_OPTS = \
	--enable-drm=no \
	--enable-glesv3=no \
	--enable-egl=no \
    --enable-glx=no \
	--enable-interpreter=no

HICAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman minigui

# Just the bare minimum to make other host-* packages happy
HOST_HICAIRO_CONF_OPTS = \
	--enable-trace=no \
	--enable-interpreter=no \
	--disable-directfb \
	--enable-ft \
	--disable-gobject \
	--disable-glesv2 \
	--disable-vg \
	--disable-xlib \
	--disable-xcb \
	--without-x \
	--disable-xlib-xrender \
	--disable-ps \
	--disable-pdf \
	--enable-png \
	--disable-script \
	--disable-svg \
	--disable-tee \
	--disable-xml
HOST_HICAIRO_DEPENDENCIES = \
	host-freetype \
	host-fontconfig \
	host-libpng \
	host-pixman \
	host-pkgconf

# DirectFB svg support rely on Cairo and Cairo DirectFB support depends on
# DirectFB. Break circular dependency by disabling DirectFB support in Cairo
# (which is experimental)
ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
HICAIRO_CONF_OPTS += --enable-directfb=yes
HICAIRO_DEPENDENCIES += directfb
else
HICAIRO_CONF_OPTS += --enable-directfb=no
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
HICAIRO_CONF_OPTS += --enable-ft=yes
HICAIRO_DEPENDENCIES += freetype
else
HICAIRO_CONF_OPTS += --enable-ft=no
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
HICAIRO_CONF_OPTS += --enable-gobject=yes
HICAIRO_DEPENDENCIES += libglib2
else
HICAIRO_CONF_OPTS += --enable-gobject=no
endif

# Can use GL or GLESv2 but not both
ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
HICAIRO_CONF_OPTS += --enable-gl=yes --enable-glesv2=no
HICAIRO_DEPENDENCIES += libgl
else
ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
HICAIRO_CONF_OPTS += --enable-gl=no --enable-glesv2=yes
HICAIRO_DEPENDENCIES += libgles
else
HICAIRO_CONF_OPTS += --enable-gl=no --enable-glesv2=no
endif
endif

ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
HICAIRO_CONF_OPTS += --enable-vg=yes
HICAIRO_DEPENDENCIES += libopenvg
else
HICAIRO_CONF_OPTS += --enable-vg=no
endif

ifeq ($(BR2_PACKAGE_LZO),y)
HICAIRO_DEPENDENCIES += lzo
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
HICAIRO_CONF_OPTS += --enable-xlib=yes --enable-xcb=yes --with-x
HICAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
else
HICAIRO_CONF_OPTS += --enable-xlib=no --enable-xcb=no --without-x
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
HICAIRO_CONF_OPTS += --enable-xlib-xrender=yes
HICAIRO_DEPENDENCIES += xlib_libXrender
else
HICAIRO_CONF_OPTS += --enable-xlib-xrender=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_PS),y)
HICAIRO_CONF_OPTS += --enable-ps=yes
HICAIRO_DEPENDENCIES += zlib
else
HICAIRO_CONF_OPTS += --enable-ps=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_PDF),y)
HICAIRO_CONF_OPTS += --enable-pdf=yes
HICAIRO_DEPENDENCIES += zlib
else
HICAIRO_CONF_OPTS += --enable-pdf=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_PNG),y)
HICAIRO_CONF_OPTS += --enable-png=yes
HICAIRO_DEPENDENCIES += libpng
else
HICAIRO_CONF_OPTS += --enable-png=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_SCRIPT),y)
HICAIRO_CONF_OPTS += --enable-script=yes
else
HICAIRO_CONF_OPTS += --enable-script=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_SVG),y)
HICAIRO_CONF_OPTS += --enable-svg=yes
else
HICAIRO_CONF_OPTS += --enable-svg=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_TEE),y)
HICAIRO_CONF_OPTS += --enable-tee=yes
else
HICAIRO_CONF_OPTS += --enable-tee=no
endif

ifeq ($(BR2_PACKAGE_HICAIRO_XML),y)
HICAIRO_CONF_OPTS += --enable-xml=yes
else
HICAIRO_CONF_OPTS += --enable-xml=no
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))
