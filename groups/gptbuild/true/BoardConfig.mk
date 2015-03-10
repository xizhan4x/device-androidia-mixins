# can't use := here, as PRODUCT_OUT is not defined yet
GPTIMAGE_BIN = $(PRODUCT_OUT)/$(TARGET_PRODUCT).img

BOARD_FLASHFILES += $(GPTIMAGE_BIN):$(TARGET_PRODUCT).img
