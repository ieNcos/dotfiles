{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      # Follow corresponding `release` branch from Home Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: let
    system = "x86_64-linux" ;
  in {
    homeConfigurations."ieNcos" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
      modules = [ ./home.nix ];
    };
  };
}


