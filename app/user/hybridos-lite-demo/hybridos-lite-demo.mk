HYBRIDOS_LITE_DEMO_SITE = https://gitlab.fmsoft.cn/hybridos/hybridos-lite
HYBRIDOS_LITE_DEMO_VERSION = cd5296565ddb8c54d33a014c389aa4c42dcfda72
HYBRIDOS_LITE_DEMO_SITE_METHOD = git
HYBRIDOS_LITE_DEMO_INSTALL_STAGING = YES
HYBRIDOS_LITE_DEMO_DEPENDENCIES = libglib2 minigui mgeff hicairo hicairo hisvg

$(eval $(cmake-package))
