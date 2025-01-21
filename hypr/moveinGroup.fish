#! /usr/bin/fish

set workspace $(hyprctl activeworkspace | awk 'NR == 1 {print$4}')
set groupname $(string sub -l 1 -s 2 $workspace)
set ingroup $(string sub -l 1 -s 3 $workspace)

switch $ingroup
    case 'a'
        hyprctl dispatch movetoworkspace name:$groupname"b"
        set -U HYPRWORKSPACE$groupname "b"

    case 'b'
        hyprctl dispatch movetoworkspace name:$groupname"a"
        set -U HYPRWORKSPACE$groupname "a"
end
