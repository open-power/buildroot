################################################################################
#
# skiboot
#
################################################################################

SKIBOOT_VERSION = 7a790f211b2e79dcb49b650128d50f2f39c4edde
SKIBOOT_SITE = $(call github,open-power,skiboot,$(SKIBOOT_VERSION))
SKIBOOT_INSTALL_IMAGES = YES
SKIBOOT_INSTALL_TARGET = NO

ifeq ($(BR2_TARGET_SKIBOOT_EMBED_PAYLOAD),y)
SKIBOOT_MAKE_OPTS += KERNEL="$(BINARIES_DIR)/$(LINUX_IMAGE_NAME)"

ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
SKIBOOT_DEPENDENCIES += linux26-rebuild-with-initramfs
else
SKIBOOT_DEPENDENCIES += linux
endif

endif

define SKIBOOT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(SKIBOOT_MAKE_OPTS) -C $(@D) all
endef

define SKIBOOT_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 755 $(@D)/skiboot.lid $(BINARIES_DIR)
endef

$(eval $(generic-package))
