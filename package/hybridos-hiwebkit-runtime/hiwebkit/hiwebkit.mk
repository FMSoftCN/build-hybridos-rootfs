################################################################################
#
# hiwebkit
#
################################################################################

HIWEBKIT_SITE = https://gitlab.fmsoft.cn/hybridos/hiwebkit
HIWEBKIT_VERSION = 98445c724c761d0b22ef8ac193f735af7564b541
HIWEBKIT_SITE_METHOD = git
HIWEBKIT_INSTALL_STAGING = YES
HIWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
HIWEBKIT_LICENSE_FILES = \
	Source/WebCore/LICENSE-APPLE \
	Source/WebCore/LICENSE-LGPL-2.1
HIWEBKIT_DEPENDENCIES = host-python host-gperf \
	enchant icu harfbuzz jpeg libgcrypt libsecret libsoup \
	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2 atk \
	hibus hicairo minigui
HIWEBKIT_CONF_OPTS = \
	-DPORT=HBD \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-DDEVELOPER_MODE=ON \
	-DENABLE_ACCELERATED_2D_CANVAS=OFF \
	-DENABLE_WEBGL=OFF \
	-DENABLE_WEBGL2=OFF \
	-DENABLE_MINIBROWSER=ON \
	-DCMAKE_BUILD_TYPE=release \
	-DENABLE_RSQL=OFF \
	-DENABLE_NOTIFICATIONS=OFF \
	-DENABLE_WEB_AUDIO=OFF \
	-DENABLE_VIDEO=OFF \
	-DENABLE_VIDEO_PRESENTATION_MODE=OFF \
	-DENABLE_VIDEO_USES_ELEMENT_FULLSCREEN=OFF \
	-DENABLE_ENCRYPTED_MEDIA=OFF \
	-DENABLE_LEGACY_ENCRYPTED_MEDIA=OFF \
	-DENABLE_MEDIA_CAPTURE=OFF \
	-DENABLE_MEDIA_CONTROLS_SCRIPT=OFF \
	-DENABLE_MEDIA_SESSION=OFF \
	-DENABLE_MEDIA_SOURCE=OFF \
	-DENABLE_MEDIA_STATISTICS=OFF \
	-DENABLE_MEDIA_STREAM=OFF \
	-DENABLE_RESOLUTION_MEDIA_QUERY=OFF \
	-DUSE_GSTREAMER_GL=OFF \
	-DENABLE_NETSCAPE_PLUGIN_API=OFF \
	-DENABLE_PDFKIT_PLUGIN=OFF \
	-DENABLE_BUBBLEWRAP_SANDBOX=OFF \
    -DUSE_WPE_RENDERER=OFF \
    -DENABLE_INTROSPECTION=OFF \
    -DENABLE_GRAPHICS_CONTEXT_GL=OFF \
    -DUSE_LIBNOTIFY=OFF \
	-DUSE_LIBHYPHEN=OFF \
	-DUSE_SYSTEMD=OFF

define HIWEBKIT_INSTALL_JS_HYBRIDOS
	$(INSTALL) -d $(TARGET_DIR)/opt/view-renderers/views.fmsoft.cn
	$(INSTALL) -D -m 0644 $(@D)/lib/libjshybridos.so \
        $(TARGET_DIR)/opt/view-renderers/views.fmsoft.cn
endef
HIWEBKIT_POST_INSTALL_TARGET_HOOKS += HIWEBKIT_INSTALL_JS_HYBRIDOS

$(eval $(cmake-package))
