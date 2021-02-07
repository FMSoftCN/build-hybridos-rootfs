HIBUS_SITE = https://gitlab.fmsoft.cn/hybridos/hibus
HIBUS_VERSION = 99c2e996fa343059e6fe69f57123995878e4a785
HIBUS_SITE_METHOD = git
HIBUS_INSTALL_STAGING = YES
HIBUS_DEPENDENCIES = hibox libopenssl libglib2
HIBUS_CONF_OPTS = -DBUILD_CMDLINE=OFF

$(eval $(cmake-package))
