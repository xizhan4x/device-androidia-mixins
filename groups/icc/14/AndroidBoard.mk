# Path to ICC from repo
ICC_ROOT_PATH := $(ANDROID_BUILD_TOP)/icc

ICC_PATH := $(ICC_ROOT_PATH)/bin/ia32:$(PPREF)/bin
ICC_LD_LIBRARY_PATH :=  $(ICC_ROOT_PATH)/compiler/lib/ia32
ICC_LIBRARY_PATH := $(ICC_ROOT_PATH)/compiler/lib/ia32
ICC_LICENSE_FILE := $(ICC_ROOT_PATH)/licenses
ICC_INCLUDE_PATH := $(ICC_ROOT_PATH)/compiler/include:$(ICC_ROOT_PATH)/PRIVATE/ips2013/external_req/include/clang

INCLUDE := $(INCLUDE):${ICC_INCLUDE_PATH}
PATH := $(ICC_PATH):${PATH}
ifeq ('${LD_LIBRARY_PATH}','')
       LD_LIBRARY_PATH := $(ICC_LD_LIBRARY_PATH)
else
       LD_LIBRARY_PATH := $(ICC_LD_LIBRARY_PATH):${LD_LIBRARY_PATH}
endif
ifeq ('${LIBRARY_PATH}','')
       LIBRARY_PATH := $(ICC_LIBRARY_PATH)
else
       LIBRARY_PATH := $(ICC_LIBRARY_PATH):${LIBRARY_PATH}
endif
ifeq ('${INTEL_LICENSE_FILE}','')
       INTEL_LICENSE_FILE := $(ICC_LICENSE_FILE)
else
       # In OC6, their existing PATH need to set first
       INTEL_LICENSE_FILE := ${INTEL_LICENSE_FILE}:$(ICC_LICENSE_FILE)
endif

# Check if 1A Environment, then set the variables
ifneq ($(wildcard $(ANDROID_BUILD_TOP)/.repo/),)
{{#icc_include_path}}
export INCLUDE
{{/icc_include_path}}
export PATH
export LD_LIBRARY_PATH
export LIBRARY_PATH
export INTEL_LICENSE_FILE
endif
