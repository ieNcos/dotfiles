{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ieNcos";
  home.homeDirectory = "/home/ieNcos";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.ffmpeg
  ];

  programs.neovim = {
    enable = true;
    # not work
    # defaultEditor = true;

    extraPackages = with pkgs; [
      gcc
      clang-tools
      rust-analyzer
      haskell-language-server
    ];
    # plugins = [
    #   pkgs.vimPlugins.nvim-treesitter
    #   (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [ p.cpp p.scheme p.rust ]))
    # ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    "Documents/dotfiles".source = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles;
    "Documents/books".source    = config.lib.file.mkOutOfStoreSymlink ~/.backpack/books;

    ".config/emacs".source      = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/emacs;
    ".config/fish".source       = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/fish;
    ".config/hypr".source       = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/hypr;
    ".config/kitty".source      = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/kitty;
    ".config/nvim".source       = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/nvim;
    ".config/tmux".source       = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/tmux;
    ".config/waybar".source     = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/waybar;
    ".config/yazi".source       = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/yazi;
    ".config/zathura".source    = config.lib.file.mkOutOfStoreSymlink ~/.backpack/dotfiles/zathura;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ieNcos/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # not work
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
