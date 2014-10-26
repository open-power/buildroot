################################################################################
#
# ipmitool
#
################################################################################

IPMITOOL_VERSION = 1.8.14
IPMITOOL_SITE = http://sourceforge.net/projects/ipmitool/files/ipmitool/$(IPMITOOL_VERSION)/
IPMITOOL_LICENSE = BSD-4c
IPMITOOL_LICENSE_FILES = COPYING

$(eval $(autotools-package))
