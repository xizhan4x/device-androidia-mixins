{{#custom}}
BOARD_KERNEL_CMDLINE += \
	intel_pstore_ram.record_size={{{record_size}}} \
	intel_pstore_ram.console_size={{{console_size}}} \
	intel_pstore_ram.ftrace_size={{{ftrace_size}}} \
	intel_pstore_ram.dump_oops={{{dump_oops}}} \
	intel_pstore_ram.ecc={{{ecc}}} \
{{/custom}}
