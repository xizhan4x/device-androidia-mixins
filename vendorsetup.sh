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

    local ring
    if [ -d .repo/ ]; then
        # .repo folder will be present in root of environment when 1A manifest is synced
        # using repo tool. Usecase: 1A dev/build host
        ring=$(grep "One_Android_Ring" .repo/manifest.xml | cut -f2 -d\')
    elif [ -d .hive/ ]; then
        # .hive folder will be present in root of environment when 1A manifest is synced
        # using bee tool. Usecase: OC6 dev/build host
        ring=$(grep -r "<default " ./.hive/default.xml | cut -f2 -d\" | cut -f4 -d\/)
    elif [ -d ../.hive/ ]; then
        # .hive folder will be present in root of environment when OC6 manifest is synced
        # using bee tool. But there is "android" folder from where "lunch" is invoked.
        # Hence need to check one level above (parent) for presence of .hive folder.
        # Usecase: OC6 dev/build host
        ring=$(grep -r "<default " ../.hive/manifest/aosp-1a-* | cut -f4 -d\" | cut -f4 -d\/)
    fi

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

    # cherry-picking patches on top of ring0 for some platforms
    if [[ "${ring}" == 0 ]]; then
        echo "Ring 0 is vanilla AOSP"
        rm -rf vendor/intel/utils/Android.mk
        target_platform_version=$(get_build_var PLATFORM_VERSION_CODENAME)
        local patch_folder=vendor/intel/utils/android_o/google_diff
        if [  "$target_platform_version"x = "OMR1"x ]; then
           patch_folder=vendor/intel/utils/android_omr1/google_diff
        fi

        # Check if there is a list of files to parse and apply patches listed in them if any
        for file in `find $patch_folder -type f -o -type l 2>/dev/null` ; do
            if [[ "$TARGET_PRODUCT" == $(basename $file) ]]; then
                echo "Applying patche(s) needed for $TARGET_PRODUCT"
                vendor/intel/utils/autopatch.py -f $file
                local ret=$?
                if [ $ret -ne 0 ]; then
                    local files_with_issues="$files_with_issues $file"
                fi
                # If some patch does not apply create Android.mk to stop compilation.
                if [ -n "$files_with_issues" ]; then
                    echo "\$(error \"[GOOGLE_DIFF] Some patches given to autopatch did not applied correctly in $files_with_issues.\") " > vendor/intel/utils/Android.mk
                fi
            fi
        done
    fi
}

# a small alias, to run mixin-update from anywhere in the tree.
function mixinup
{
    local T=$(gettop)
    (cd $T && ./device/intel/mixins/mixin-update $@)
}
