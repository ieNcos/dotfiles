if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting

if test -z "$DISPLAY"
    Hyprland
end

thefuck --alias | source
