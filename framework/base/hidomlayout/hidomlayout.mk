HIDOMLAYOUT_SITE = https://gitlab.fmsoft.cn/hybridos/hidomlayout
HIDOMLAYOUT_VERSION = e9ebc3894b4917a8004721e45f288c34c5c48193
HIDOMLAYOUT_SITE_METHOD = git
HIDOMLAYOUT_INSTALL_STAGING = YES
HIDOMLAYOUT_DEPENDENCIES = hibox libopenssl libglib2

$(eval $(cmake-package))
