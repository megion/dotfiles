#!/bin/bash
############################
Need implements next:
1. when vim open read gnome terminal background color
2. define $scheme by background color
3. call `~/dotfiles/vim-servers-theme.sh $scheme >/dev/null 2>&1`

1. add vim function return $scheme `dark` or `light`
by gnome terminal background color
############################


########## Variables
dconfdir=/org/gnome/terminal/legacy/profiles:
profile=my_solarized

profile_path=$dconfdir/$profile


get_profile_name() {
    local profile_name

  # dconf still return "" when the key does not exist, gconftool-2 return 0,
  # but it does priint error message to STDERR, and command substitution
  # only gets STDOUT which means nothing at this point.
  profile_name="$(gsettings get org.gnome.Terminal.Legacy.Profile:$dconfdir/":"$1/ visible-name)"
  profile_name="${profile_name:1:-1}"
  echo $profile_name
}


get_uuid() {
    local profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
    # Print the UUID linked to the profile name sent in parameter
    local profile_name=$1
    for i in ${!profiles[*]}
    do
        if [[ "$(dconf read $dconfdir/:${profiles[i]}/visible-name)" == \
            "'$profile_name'" ]]
                then echo "${profiles[i]}"
                    return 0
        fi
    done
    echo "$profile_name"
}

profile_uuid="$(get_uuid "$profile")"
echo $profile_uuid
get_profile_name $profile_uuid

#echo $profile_path/background-color

profile_path_uuid=$dconfdir/:$profile_uuid
echo $profile_path_uuid
#local bg_color
bg_color="$(dconf read $profile_path_uuid/background-color)"
echo "background" $bg_color
dconf read $profile_path_uuid/background-color
