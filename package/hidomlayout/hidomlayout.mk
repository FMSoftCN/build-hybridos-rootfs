HIDOMLAYOUT_SITE = https://gitlab.fmsoft.cn/hybridos/hidomlayout
HIDOMLAYOUT_VERSION = 2910e9daa1fbccbf213611f71ce9b90d9fae9068
HIDOMLAYOUT_SITE_METHOD = git
HIDOMLAYOUT_INSTALL_STAGING = YES
HIDOMLAYOUT_DEPENDENCIES = hibox libopenssl libglib2

$(eval $(cmake-package))
