HISHELL_SITE = https://gitlab.fmsoft.cn/hybridos/hiShell
HISHELL_VERSION = 81f6dece5be68f5e9686e4050694aeee35fbaca7
HISHELL_SITE_METHOD = git
HISHELL_INSTALL_STAGING = YES

HISHELL_DEPENDENCIES = mgeff hiwebkit hiacejs


define HISHELL_INSTALL_FONT
	cd $(TARGET_DIR)/usr/libexec/samples/app/fonts/ && ln -sf /usr/share/fonts/SourceHanSansCN-Regular.otf SourceHanSansSC-Regular.otf
endef
HISHELL_POST_INSTALL_TARGET_HOOKS += HISHELL_INSTALL_FONT

$(eval $(cmake-package))
