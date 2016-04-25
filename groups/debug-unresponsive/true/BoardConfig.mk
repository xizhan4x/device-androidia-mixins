ifneq ($(TARGET_BUILD_VARIANT),user)

ADDITIONAL_DEFAULT_PROPERTIES += sys.dropbox.max_size_kb=4096

ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.binder_stats.uiwdt=1
ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.binder_stats.anr=1

ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.peer_depth={{peer_depth}}

ADDITIONAL_DEFAULT_PROPERTIES += sys.dump.stacks_timeout={{stacks_timeout}}

endif
