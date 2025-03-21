{
  description = "Andrei Floroiu DEV NixOS configuration";

  inputs = {
    # Other flakes
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
          modules = let
            baseModules = [
              nixvim.nixosModules.nixvim
              ./config/nixvim/default.nix
              ./config/packages-common-config.nix
              ./config/tmux-config.nix
              ./config/zsh-config.nix
              (./hosts + "/${hostname}.nix")
            ];
            devModules = if hostname == "dev" || hostname == "wsl" then [
              ./config/packages-config.nix
              ./config/packages-dev-config.nix
              ({ pkgs, ... }: {
                 environment.systemPackages = with pkgs; [
                    nodejs_22
                    #nodejs_20
                    #nodejs_18
                    yarn
                    nodePackages.node-gyp
                    nodePackages.node-gyp-build
                 ];
               })
            ] else [];
            serverModules = if hostname == "jump" || hostname == "web" then [
              ./config/packages-server-config.nix
            ] else [];
          in
            baseModules ++ devModules ++ serverModules;

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
        "dev-x86_64" = mkSystem systemX86_64 "dev";
        "wsl-x86_64" = mkSystem systemX86_64 "wsl";
        "jump-x86_64" = mkSystem systemX86_64 "jump";
        "web-x86_64" = mkSystem systemX86_64 "web";
        # aarch64 configurations
        "dev-aarch64" = mkSystem systemAarch64 "dev";
        "wsl-aarch64" = mkSystem systemAarch64 "wsl";
        "jump-aarch64" = mkSystem systemAarch64 "jump";
        "web-aarch64" = mkSystem systemAarch64 "web";
      };
   };
}
