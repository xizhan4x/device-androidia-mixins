BOARD_KERNEL_CMDLINE += \
	memmap={{{size}}}\$${{{address}}} \
	ramoops.mem_address={{{address}}} \
	ramoops.mem_size={{{size}}} \
{{#custom}}
	ramoops.record_size={{{record_size}}} \
	ramoops.console_size={{{console_size}}} \
	ramoops.ftrace_size={{{ftrace_size}}} \
	ramoops.dump_oops={{{dump_oops}}} \
	ramoops.ecc={{{ecc}}} \
{{/custom}}
