HIBUS_SITE = https://gitlab.fmsoft.cn/hybridos/hibus
HIBUS_VERSION = 1df4d4419af33189d60285291c6948edc3f8b79b
HIBUS_SITE_METHOD = git
HIBUS_INSTALL_STAGING = YES
HIBUS_DEPENDENCIES = hibox libopenssl

$(eval $(cmake-package))
