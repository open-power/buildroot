################################################################################
#
# skiboot
#
################################################################################

SKIBOOT_VERSION = 1d880992fd8c8457a2d990ac6622cfd58fb1b261
SKIBOOT_SITE = $(call github,open-power,skiboot,$(SKIBOOT_VERSION))
SKIBOOT_INSTALL_IMAGES = YES

define SKIBOOT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
endef

define SKIBOOT_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 755 $(@D)/skiboot.lid $(BINARIES_DIR)
endef

$(eval $(generic-package))
