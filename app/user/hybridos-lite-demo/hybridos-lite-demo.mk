HYBRIDOS_LITE_DEMO_SITE = https://gitlab.fmsoft.cn/hybridos/hybridos-lite
HYBRIDOS_LITE_DEMO_VERSION = 8bf92fc04d2c39e13c3ffb5009167d104ec3653a
HYBRIDOS_LITE_DEMO_SITE_METHOD = git
HYBRIDOS_LITE_DEMO_INSTALL_STAGING = YES
HYBRIDOS_LITE_DEMO_DEPENDENCIES = libglib2 minigui mgeff hicairo hicairo hisvg

$(eval $(cmake-package))
