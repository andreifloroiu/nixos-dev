{
  description = "Andrei Floroiu DEV NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixvim, nixos-wsl, vscode-server, ... }@inputs:
    let
      mkSystem = system: hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./config/packages-config.nix
            ./config/nixvim/default.nix
            ./config/tmux-config.nix
            ./config/zsh-config.nix
            (./hosts + "/${hostname}.nix")
            home-manager.nixosModules.home-manager
            nixvim.nixosModules.nixvim
            ({ pkgs, ... }: {
              environment.systemPackages = with pkgs; [
                nodejs_22
                nodejs_20
                nodejs_18
                yarn
                nodePackages.node-gyp
                nodePackages.node-gyp-build
              ];
            })
          ];
          specialArgs = {
            inherit inputs system;
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        };
    in {
      nixosConfigurations = {
        # x86_64 configurations
        wsl-x86_64 = mkSystem "x86_64-linux" "wsl";
        standalone-x86_64 = mkSystem "x86_64-linux" "standalone";

        # aarch64 configurations
        wsl-aarch64 = mkSystem "aarch64-linux" "wsl";
        standalone-aarch64 = mkSystem "aarch64-linux" "standalone";
      };
    };
}
