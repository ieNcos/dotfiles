#! /usr/bin/fish

set workspace $(hyprctl activeworkspace | awk 'NR == 1 {print$4}')
set groupname $(string sub -l 1 -s 2 $workspace)
set state $(string sub -l 1 -s 3 $workspace)
set state_variable HYPRWORKSPACE$groupname
echo groupname $groupname

echo state $state
switch $state
    case a
        hyprctl dispatch workspace name:$groupname"b"
        set -U $state_variable b && echo done
        echo set to b: $state_variable is $$state_variable
    case b
        hyprctl dispatch workspace name:$groupname"a"
        set -U $state_variable a
end
