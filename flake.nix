{
  description = "Andrei Floroiu DEV NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
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

  outputs = { self, nixpkgs, nixpkgs-stable, nixvim, nixos-wsl, vscode-server, ... }@inputs:
    let
      systemAarch64 = "aarch64-linux";
      systemX86_64 = "x86_64-linux";
      mkSystem = system: hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./config/packages-config.nix
            ./config/nixvim/default.nix
            ./config/tmux-config.nix
            ./config/zsh-config.nix
            (./hosts + "/${hostname}.nix")
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
        "wsl-x86_64" = mkSystem systemX86_64 "wsl";
        "standalone-x86_64" = mkSystem systemX86_64 "standalone";
        "admin-x86_64" = mkSystem systemX86_64 "admin";
        # aarch64 configurations
        "wsl-aarch64" = mkSystem systemAarch64 "wsl";
        "standalone-aarch64" = mkSystem systemAarch64 "standalone";
        "admin-aarch64" = mkSystem systemAarch64 "admin";
      };
   };
}
