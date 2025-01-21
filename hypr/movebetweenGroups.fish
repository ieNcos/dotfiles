#! /usr/bin/fish
set target $argv
set state_variable HYPRWORKSPACE$target
set state $$state_variable
switch $state
    case a
        hyprctl dispatch movetoworkspace name:$target'a'
    case b
        hyprctl dispatch movetoworkspace name:$target'b'
    case '*'
        echo wrong
end
