INETD_SITE = https://gitlab.fmsoft.cn/hybridos/cn.fmsoft.hybridos.settings
INETD_VERSION = 3a5bf123095fced6b4c8015ea3f79f41d38ffb16
INETD_SITE_METHOD = git
INETD_INSTALL_STAGING = YES
INETD_DEPENDENCIES = hibox hibus

$(eval $(cmake-package))
