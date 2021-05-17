HIBUS_SITE = https://gitlab.fmsoft.cn/hybridos/hibus
HIBUS_VERSION = a7179434d248a0bfd946acdf0e548c387b56f754
HIBUS_SITE_METHOD = git
HIBUS_INSTALL_STAGING = YES
HIBUS_DEPENDENCIES = hibox libopenssl libglib2
HIBUS_CONF_OPTS = -DBUILD_CMDLINE=OFF

$(eval $(cmake-package))
