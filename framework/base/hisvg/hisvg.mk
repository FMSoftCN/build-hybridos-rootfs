HISVG_SITE = https://gitlab.fmsoft.cn/hybridos/hisvg
HISVG_VERSION = 201a9cb3af17d3bdaf579cb17ac024f62125d5b3
HISVG_SITE_METHOD = git
HISVG_INSTALL_STAGING = YES

HISVG_DEPENDENCIES = libglib2 libxml2 freetype minigui hicairo hidomlayout

$(eval $(cmake-package))

