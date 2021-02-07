HIBUS_SITE = https://gitlab.fmsoft.cn/hybridos/hibus
HIBUS_VERSION = 65f90eca6faf3559458ee8a4259f8e8a64144ae6
HIBUS_SITE_METHOD = git
HIBUS_INSTALL_STAGING = YES
HIBUS_DEPENDENCIES = hibox libopenssl libglib2

$(eval $(cmake-package))
