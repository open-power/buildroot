################################################################################
#
# kexec-lite
#
################################################################################

KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
KEXEC_LITE_LICENSE = GPL
KEXEC_LITE_DEPENDENCIES = libelf dtc

define KEXEC_LITE_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
		    CFLAGS="$(TARGET_CFLAGS)" \
		    -C $(@D) all
endef

define KEXEC_LITE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/kexec $(TARGET_DIR)/usr/sbin/
endef

$(eval $(generic-package))
