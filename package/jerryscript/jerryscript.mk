JERRYSCRIPT_SITE = https://gitlab.fmsoft.cn/3rd-party/jerryscript
JERRYSCRIPT_VERSION = ca1f9068c8054ca11ae33960801d6250746e5529
JERRYSCRIPT_SITE_METHOD = git
JERRYSCRIPT_INSTALL_STAGING = YES

JERRYSCRIPT_DEPENDENCIES = jpeg libpng

JERRYSCRIPT_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=MinSizeRel \
	-DEXTERNAL_COMPILE_FLAGS=-Wno-unused-function \
	-DBUILD_SHARED_LIBS=ON \
	-DJERRY_CMDLINE_SNAPSHOT=ON \
	-DJERRY_ERROR_MESSAGES=ON \
	-DJERRY_LOGGING=ON \
	-DJERRY_GLOBAL_HEAP_SIZE=20480 \
	-DJERRY_MEM_STATS=ON \
	-DJERRY_PROFILE=es5.1 \
	-DJERRY_SNAPSHOT_EXEC=ON \
	-DJERRY_SNAPSHOT_SAVE=ON \
	-DEXTERNAL_COMPILE_FLAGS="-Wno-unused-function"

$(eval $(cmake-package))
