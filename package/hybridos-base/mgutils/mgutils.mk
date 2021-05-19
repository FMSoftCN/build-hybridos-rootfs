MGUTILS_SITE = https://gitlab.fmsoft.cn/VincentWei/mgutils
MGUTILS_VERSION = c612032c6fbde2487cd29230b42dea9f8976c818
MGUTILS_SITE_METHOD = git
MGUTILS_INSTALL_STAGING = YES

MGUTILS_DEPENDENCIES = jpeg libpng minigui

define MGUTILS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGUTILS_PRE_CONFIGURE_HOOKS += MGUTILS_RUN_AUTOGEN


$(eval $(autotools-package))
