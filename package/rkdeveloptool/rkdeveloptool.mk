################################################################################
#
# host-rkdevelotool
#
################################################################################

RKDEVELOPTOOL_VERSION = 6e92ebcf8b1812da02663494a68972f956e490d3
RKDEVELOPTOOL_SITE = $(call github,rockchip-linux,rkdeveloptool,$(RKDEVELOPTOOL_VERSION))

define HOST_RKDEVELOPTOOL_CONFIGURE_CMDS
	(cd $(@D); \
		$(HOST_DIR)/bin/autoreconf -i; \
		./configure \
			--prefix=$(HOST_DIR))
endef

define HOST_RKDEVELOPTOOL_BUILD_CMDS
	$(MAKE) -C $(@D)
	$(MAKE) install -C $(@D)
endef

$(eval $(host-generic-package))
