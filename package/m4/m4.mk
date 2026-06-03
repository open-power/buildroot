################################################################################
#
# m4
#
################################################################################

M4_VERSION = 1.4.19
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = $(BR2_GNU_MIRROR)/m4
M4_LICENSE = GPL-3.0+
M4_LICENSE_FILES = COPYING

# gcc >= 15 defaults to -std=gnu23, which is incorrectly detected by the gnulib
# copy bundled in m4 1.4.19 and breaks the host-m4 build. Force the previous
# default (-std=gnu17). Backport of upstream commit 7a07a9d155; applied
# unconditionally here because this 2025.02 branch predates and lacks the
# BR2_HOST_GCC_AT_LEAST_15 symbol used upstream (gnu17 is a no-op on gcc < 15).
HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"

$(eval $(host-autotools-package))
