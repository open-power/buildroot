################################################################################
#
# hostboot
#
################################################################################

HOSTBOOT_VERSION = f07ac6bce62c2958fd1804721e320f66c1ed4e1e
HOSTBOOT_SITE = ssh://hostboot.gerrit/hostboot
HOSTBOOT_LICENSE = Apache-2.0
HOSTBOOT_SITE_METHOD = git
HOSTBOOT_INSTALL_IMAGES = YES
HOSTBOOT_INSTALL_TARGET = NO

HOSTBOOT_MAKE_OPTS = ROOTDIR=$(@D) \
		     HOSTBOOTROOT=$(@D) \
		     CROSS_PREFIX= \
		     HOST_PREFIX= \
		     JAIL= \
		     SKIP_BINARY_FILES=1

ifneq ($(BR2_TARGET_HOSTBOOT_CONFIG),)
	HOSTBOOT_MAKE_OPTS += CONFIG_FILE="$(BR2_TARGET_HOSTBOOT_CONFIG)"
endif

define HOSTBOOT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(HOSTBOOT_MAKE_OPTS) -C $(@D)
endef

define HOSTBOOT_INSTALL_IMAGES_CMDS
        cd $(@D) && \
		$(@D)/src/build/tools/hbDistribute \
			--openpower $(BINARIES_DIR)/hostboot/
endef

$(eval $(generic-package))
