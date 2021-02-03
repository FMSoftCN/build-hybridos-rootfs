MGEFF_SITE = https://gitlab.fmsoft.cn/VincentWei/mgeff
MGEFF_VERSION = d995f3b5001c7dd7127175356c78d005186d4350
MGEFF_SITE_METHOD = git
MGEFF_INSTALL_STAGING = YES

MGEFF_DEPENDENCIES = minigui mgplus

define MGEFF_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGEFF_PRE_CONFIGURE_HOOKS += MGEFF_RUN_AUTOGEN

$(eval $(autotools-package))
