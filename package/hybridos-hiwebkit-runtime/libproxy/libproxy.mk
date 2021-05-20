LIBPROXY_VERSION = 0.4.15
LIBPROXY_SOURCE = libproxy-$(LIBPROXY_VERSION).tar.xz
LIBPROXY_SITE = https://github.com/libproxy/libproxy/releases/download/$(LIBPROXY_VERSION)
LIBPROXY_INSTALL_STAGING = YES

$(eval $(cmake-package))
