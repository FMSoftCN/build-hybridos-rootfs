MGPLUS_SITE = https://gitlab.fmsoft.cn/VincentWei/mgplus
MGPLUS_VERSION = 12f086c7ed124500f1147b1db2038cd9763e386d
MGPLUS_SITE_METHOD = git
MGPLUS_INSTALL_STAGING = YES

MGPLUS_DEPENDENCIES = minigui

define MGPLUS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGPLUS_PRE_CONFIGURE_HOOKS += MGPLUS_RUN_AUTOGEN

$(eval $(autotools-package))
