################################################################################
#
# skiboot
#
################################################################################

SKIBOOT_VERSION = 2e3bcfe490bb2ae0e3fbe5c062677026d2096093
SKIBOOT_SITE = $(call github,open-power,skiboot,$(SKIBOOT_VERSION))
SKIBOOT_INSTALL_IMAGES = YES
SKIBOOT_INSTALL_TARGET = NO

SKIBOOT_MAKE_OPTS += GIT_SHA=$(shell echo $(SKIBOOT_VERSION) | head -c7)

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
