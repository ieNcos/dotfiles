#! /usr/bin/fish
set target $argv
set state_variable HYPRWORKSPACE$target
set state $$state_variable
switch $state
    case a
        hyprctl dispatch workspace name:$target'a'
    case b
        hyprctl dispatch workspace name:$target'b'
    case '*'
        echo wrong
end
