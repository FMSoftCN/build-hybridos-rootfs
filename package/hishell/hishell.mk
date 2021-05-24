HISHELL_SITE = https://gitlab.fmsoft.cn/hybridos/hiShell
HISHELL_VERSION = c9e1d19d9eee2a955c6ae0f0f79077b7202f2ed7
HISHELL_SITE_METHOD = git
HISHELL_INSTALL_STAGING = YES

HISHELL_DEPENDENCIES = mgeff hicairo hiwebkit hiacejs hisvg hidomlayout


define HISHELL_INSTALL_FONT
	cd $(TARGET_DIR)/usr/libexec/samples/app/fonts/ && ln -sf /usr/share/fonts/sans-serif-hei-chinese-medium.ttf SourceHanSansSC-Regular.otf
endef
HISHELL_POST_INSTALL_TARGET_HOOKS += HISHELL_INSTALL_FONT

$(eval $(cmake-package))
