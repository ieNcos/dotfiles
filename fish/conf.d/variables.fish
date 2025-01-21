#set -x XDG_RUNTIME_DIR /run/user/$(id -u)
set -a PATH ~/.local/bin
set -a PATH ~/.ghcup/bin
set -a PATH ~/.ghcup/ghc/9.4.8/bin
set -a PATH ~/.local/share/cargo/bin

set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache

# set -x GHCUP_USE_XDG_DIRS "yes" # anything is ok


set -x CARGO_HOME ~/.local/share/cargo
set -x RUSTUP_HOME ~/.local/share/rustup

set -x HYPRSHOT_DIR ~/Pictures/screenshots

set -x RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -x RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

set -x GTX_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im fcitx
set -x SDL_IM_MODULE fcitx
