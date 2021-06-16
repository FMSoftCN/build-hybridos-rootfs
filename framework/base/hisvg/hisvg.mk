HISVG_SITE = https://gitlab.fmsoft.cn/hybridos/hisvg
HISVG_VERSION = b21fb291f7d1ec9f0eb77d40594df3482c85facb
HISVG_SITE_METHOD = git
HISVG_INSTALL_STAGING = YES

HISVG_DEPENDENCIES = libglib2 libxml2 freetype minigui hicairo hidomlayout

$(eval $(cmake-package))

