SETTINGS_SITE = https://gitlab.fmsoft.cn/hybridos/cn.fmsoft.hybridos.settings
SETTINGS_VERSION = 3a5bf123095fced6b4c8015ea3f79f41d38ffb16
SETTINGS_SITE_METHOD = git
SETTINGS_INSTALL_STAGING = YES
SETTINGS_DEPENDENCIES = hibox hibus

$(eval $(cmake-package))
