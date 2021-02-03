MGUTILS_SITE = https://gitlab.fmsoft.cn/VincentWei/mgutils
MGUTILS_VERSION = d9d96e1a5cd88e1d4f0b843f1f503da973c35add
MGUTILS_SITE_METHOD = git
MGUTILS_INSTALL_STAGING = YES

MGUTILS_DEPENDENCIES = jpeg libpng

define MGUTILS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGUTILS_PRE_CONFIGURE_HOOKS += MGUTILS_RUN_AUTOGEN


$(eval $(autotools-package))
