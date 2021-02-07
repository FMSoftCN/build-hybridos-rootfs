INETD_SITE = https://gitlab.fmsoft.cn/hybridos/cn.fmsoft.hybridos.settings
INETD_VERSION = fdfa3f3183246c822d9a8458e26cb8651466db4d
INETD_SITE_METHOD = git
INETD_INSTALL_STAGING = YES
INETD_DEPENDENCIES = hibox hibus

$(eval $(cmake-package))
