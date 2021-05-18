HYBRIDOS_LITE_SITE = https://gitlab.fmsoft.cn/hybridos/hybridos-lite
HYBRIDOS_LITE_VERSION = 654478f97a699b1fd0a4985f09b1b14018fbd291
HYBRIDOS_LITE_SITE_METHOD = git
HYBRIDOS_LITE_INSTALL_STAGING = YES
HYBRIDOS_LITE_DEPENDENCIES = libglib2 minigui mgeff hicairo hicairo hisvg

$(eval $(cmake-package))
