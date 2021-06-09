MGNCS4TOUCH_SITE = https://gitlab.fmsoft.cn/VincentWei/mgncs4touch
MGNCS4TOUCH_VERSION = 3f0416a31e1ba4492e0cc4cd50ac2d63ce8c8929
MGNCS4TOUCH_SITE_METHOD = git
MGNCS4TOUCH_INSTALL_STAGING = YES

MGNCS4TOUCH_DEPENDENCIES = jpeg libpng sqlite libxml2 minigui mgplus mgncs mgeff chipmunk

define MGNCS4TOUCH_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
MGNCS4TOUCH_PRE_CONFIGURE_HOOKS += MGNCS4TOUCH_RUN_AUTOGEN


$(eval $(autotools-package))
