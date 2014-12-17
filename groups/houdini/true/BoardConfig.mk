# enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

# Native Bridge ABI List
NATIVE_BRIDGE_ABI_LIST_32_BIT := armeabi-v7a armeabi

# Native Bridge ABI 64 Bit List
NATIVE_BRIDGE_ABI_LIST_64_BIT :=

# Support 64 Bit Apps
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)

  TARGET_CPU_ABI_LIST_64_BIT += $(NATIVE_BRIDGE_ABI_LIST_64_BIT)

  ifeq ($(TARGET_SUPPORTS_32_BIT_APPS),true)
    # Set 32 Bit ABI List
    TARGET_CPU_ABI_LIST_32_BIT += $(NATIVE_BRIDGE_ABI_LIST_32_BIT)
  endif

# Support 32 Bit Apps Only
else

  TARGET_CPU_ABI_LIST_32_BIT += $(NATIVE_BRIDGE_ABI_LIST_32_BIT)

endif
