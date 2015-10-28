{{#custom}}
BOARD_KERNEL_CMDLINE += \
	intel_pstore_pram.record_size={{{record_size}}} \
	intel_pstore_pram.console_size={{{console_size}}} \
	intel_pstore_pram.ftrace_size={{{ftrace_size}}} \
	intel_pstore_pram.dump_oops={{{dump_oops}}} \
	intel_pstore_pram.ecc={{{ecc}}} \
{{/custom}}

PSTORE_CONFIG := PRAM
