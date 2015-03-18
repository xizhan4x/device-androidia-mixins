OVERLAY_TEL_CFG := device/intel/common/telephony-config/catalog
TEL_CATALOG := system/etc/telephony/catalog

FOUND_CONFIGS := $(wildcard $(OVERLAY_TEL_CFG)/$(TEL_SW_FOLDER)/*.xml)

PRODUCT_COPY_FILES += \
    $(foreach _conf, $(FOUND_CONFIGS), $(_conf):$(TEL_CATALOG)/$(patsubst $(OVERLAY_TEL_CFG)/%,%,$(_conf)))
