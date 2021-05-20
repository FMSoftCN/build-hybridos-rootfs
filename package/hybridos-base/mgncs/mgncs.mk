MGNCS_SITE = https://gitlab.fmsoft.cn/VincentWei/mgncs
MGNCS_VERSION = 53ec08b1ac85eef53eed23c4a848e0b724977242
MGNCS_SITE_METHOD = git
MGNCS_INSTALL_STAGING = YES

MGNCS_DEPENDENCIES = jpeg libpng sqlite libxml2 minigui mgplus 

define MGNCS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGNCS_PRE_CONFIGURE_HOOKS += MGNCS_RUN_AUTOGEN


$(eval $(autotools-package))
