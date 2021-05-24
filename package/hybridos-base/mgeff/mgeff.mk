MGEFF_SITE = https://gitlab.fmsoft.cn/VincentWei/mgeff
MGEFF_VERSION = cb15244c06a8b3eaf8dba272429784052ea3b524
MGEFF_SITE_METHOD = git
MGEFF_INSTALL_STAGING = YES

MGEFF_DEPENDENCIES = minigui mgplus

define MGEFF_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGEFF_PRE_CONFIGURE_HOOKS += MGEFF_RUN_AUTOGEN

$(eval $(autotools-package))
