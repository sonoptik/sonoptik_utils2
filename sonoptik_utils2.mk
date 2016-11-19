######################################
#
# sonoptik-utilities
#
######################################

SONOPTIK_VERSION = 
SONOPTIK_UTILS2_SITE = $(call github,sonoptik,sonoptik_utils2,$(SONOPTIK_UTILS2_VERSION))
SONOPTIK_UTILS2_BUNDLES = zzz.lv2

SONOPTIK_UTILS2_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) NOOPT=true -C $(@D)

define SONOPTIK_UTILS2_BUILD_CMDS
	$(SONOPTIK_UTILS2_TARGET_MAKE)
endef

define SONOPTIK_UTILS2_INSTALL_TARGET_CMDS
	$(SONOPTIK_UTILS2_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_PATH=/usr/lib/lv2
	cp -rL $($(PKG)_PKGDIR)/zzz.lv2/*            $(TARGET_DIR)/usr/lib/lv2/zzz.lv2/

endef

$(eval $(generic-package))
