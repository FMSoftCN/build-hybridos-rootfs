MGEFF_SITE = https://gitlab.fmsoft.cn/VincentWei/mgeff
MGEFF_VERSION = e9d3995bcc961a6a8649a1dceaba74b26ca4930b
MGEFF_SITE_METHOD = git
MGEFF_INSTALL_STAGING = YES

MGEFF_DEPENDENCIES = minigui mgplus

define MGEFF_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGEFF_PRE_CONFIGURE_HOOKS += MGEFF_RUN_AUTOGEN

$(eval $(autotools-package))
