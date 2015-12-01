# Get the AOSP Ring on OneAndroid
# Should be a comment in the manifest in the form
# <!-- One_Android_Ring='1' -->

# save the official lunch command to aosp_lunch() and source it
tmp_lunch=`mktemp`
sed '/ lunch()/,/^}/!d'  build/envsetup.sh | sed 's/function lunch/function aosp_lunch/' > ${tmp_lunch}
source ${tmp_lunch}
rm -f ${tmp_lunch}


# Override lunch function to filter lunch targets
function lunch
{

    local -a save="${LUNCH_MENU_CHOICES[@]} ${REMOVED_TARGETS[@]}"
    local -a removed_targets

    local ring=$(grep "One_Android_Ring" .repo/manifest.xml | cut -f2 -d\')

    local t

    if [[ "${ring}" =~ [0-2] ]]; then
        echo "One Android AOSP ring $ring filtering targets"

        unset LUNCH_MENU_CHOICES
        unset REMOVED_TARGETS

        for t in ${save[@]}; do
            if [[ ! "$t" =~ r2_* ]]; then
                [[ "${ring}" =~ [0-1] ]] && LUNCH_MENU_CHOICES+=($t) || removed_targets+=($t)
            else
                [[ "${ring}" =~ [0-1] ]] && removed_targets+=($t) || LUNCH_MENU_CHOICES+=($t)
            fi
        done

        export REMOVED_TARGETS=${removed_targets[@]}
    else
        echo "WARNING: Unknown One Android AOSP ring $ring"
    fi
    aosp_lunch $*
}

# a small alias, to run mixin-update from anywhere in the tree.
function mixinup
{
    local T=$(gettop)
    (cd $T && ./device/intel/mixins/mixin-update $@)
}
