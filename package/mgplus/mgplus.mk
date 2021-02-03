MGPLUS_SITE = https://gitlab.fmsoft.cn/VincentWei/mgplus
MGPLUS_VERSION = 41788f1bb4034a9e12ce8cded92c37fbd2d27348
MGPLUS_SITE_METHOD = git
MGPLUS_INSTALL_STAGING = YES

MGPLUS_DEPENDENCIES = minigui

define MGPLUS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGPLUS_PRE_CONFIGURE_HOOKS += MGPLUS_RUN_AUTOGEN

$(eval $(autotools-package))
