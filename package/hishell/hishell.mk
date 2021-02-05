HISHELL_SITE = https://gitlab.fmsoft.cn/hybridos/hiShell
HISHELL_VERSION = 81f6dece5be68f5e9686e4050694aeee35fbaca7
HISHELL_SITE_METHOD = git
HISHELL_INSTALL_STAGING = YES

HISHELL_DEPENDENCIES = mgeff hiwebkit hiacejs

$(eval $(cmake-package))
