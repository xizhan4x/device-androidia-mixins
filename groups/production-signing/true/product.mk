#
# Secure Boot Signing override
#
# Uses 'override' directive to ensure that this definition wins in dependency
# resolution.
override VERITY_SIGNER = $(HOST_ECSS_OUT_EXECUTABLES)/verity_signer
