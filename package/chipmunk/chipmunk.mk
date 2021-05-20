################################################################################
#
# chipmunk
#
################################################################################

CHIPMUNK_SITE = https://gitlab.fmsoft.cn/VincentWei/chipmunk
CHIPMUNK_VERSION = 610ea6e9109c97069f9f4ec5073c94daa843fea4
CHIPMUNK_SITE_METHOD = git
CHIPMUNK_INSTALL_STAGING = YES

CHIPMUNK_CONF_OPTS = -DBUILD_DEMOS=OFF

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
CHIPMUNK_CONF_OPTS += -DBUILD_STATIC=ON -DINSTALL_STATIC=ON
else
CHIPMUNK_CONF_OPTS += -DBUILD_STATIC=OFF -DINSTALL_STATIC=OFF
endif

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
CHIPMUNK_CONF_OPTS += -DBUILD_SHARED=ON
else
CHIPMUNK_CONF_OPTS += -DBUILD_SHARED=OFF
endif

$(eval $(cmake-package))
