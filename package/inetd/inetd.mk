INETD_SITE = https://gitlab.fmsoft.cn/hybridos/cn.fmsoft.hybridos.settings
INETD_VERSION = 820c42f4ef643cd200667d84e739c23445ecb08b
INETD_SITE_METHOD = git
INETD_INSTALL_STAGING = YES
INETD_DEPENDENCIES = hibox hibus

$(eval $(cmake-package))
