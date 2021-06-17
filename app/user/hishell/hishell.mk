HISHELL_SITE = https://gitlab.fmsoft.cn/hybridos/hiShell
HISHELL_VERSION = 64f601f0bc268ef84ef134a94fe57dbb1364041f
HISHELL_SITE_METHOD = git
HISHELL_INSTALL_STAGING = YES

HISHELL_DEPENDENCIES = mgeff hicairo hiwebkit hiacejs hisvg hidomlayout


define HISHELL_INSTALL_FONT
    $(INSTALL) -c -m 644 $(HISHELL_PKGDIR)/MiniGUI.cfg $(TARGET_DIR)/usr/libexec
	cd $(TARGET_DIR)/usr/libexec/samples/app/fonts/ && ln -sf /usr/share/fonts/sans-serif-hei-chinese-medium.ttf SourceHanSansSC-Regular.otf
endef
HISHELL_POST_INSTALL_TARGET_HOOKS += HISHELL_INSTALL_FONT

$(eval $(cmake-package))
