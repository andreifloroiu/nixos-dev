{
  description = "Andrei Floroiu DEV NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
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

  outputs =
    {
      nixpkgs,
      nixvim,
      home-manager,
      hyprland,
      nixos-wsl,
      self,
      vscode-server,
      ...
    }@inputs:
    let
      systemAarch64 = "aarch64-linux";
      systemX86_64 = "x86_64-linux";
      mkSystem =
        system: hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules =
            let
              baseModules = [
                home-manager.nixosModules.home-manager
                nixvim.nixosModules.nixvim
                (./hosts + "/${hostname}.nix")
              ];
              devModules =
                if hostname == "dev" then
                  [
                    ./modules/development.nix
                  ]
                else
                  [ ];
              desktopModules =
                if hostname == "desktop" then
                  [
                    ./modules/desktop.nix
                    hyprland.nixosModules.default
                  ]
                else
                  [ ];
              wslModules =
                if hostname == "wsl" then
                  [
                    ./modules/wsl.nix
                    nixos-wsl.nixosModules.default
                    vscode-server.nixosModules.default
                  ]
                else
                  [ ];
              serverModules =
                if hostname == "jump" || hostname == "web" then
                  [
                    ./modules/server.nix
                  ]
                else
                  [ ];
            in
            baseModules ++ desktopModules ++ devModules ++ wslModules ++ serverModules;
        };
    in
    {
      nixosModules = {
        base =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [
              home-manager.nixosModules.default
              nixvim.nixosModules.default
              ./modules/base.nix
            ];
          };
        desktop =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [
              home-manager.nixosModules.default
              nixvim.nixosModules.default
              hyprland.nixosModules.default
              ./modules/desktop.nix
            ];
          };
        development =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [
              home-manager.nixosModules.default
              nixvim.nixosModules.default
              ./modules/development.nix
            ];
          };
        server =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [
              home-manager.nixosModules.default
              nixvim.nixosModules.default
              ./modules/server.nix
            ];
          };
        wsl =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [
              home-manager.nixosModules.default
              nixvim.nixosModules.default
              nixos-wsl.nixosModules.default
              vscode-server.nixosModules.default
              ./modules/wsl.nix
            ];
          };
      };
      nixosConfigurations = {
        # x86_64 configurations
        "dev-x86_64" = mkSystem systemX86_64 "dev";
        "desktop-x86_64" = mkSystem systemX86_64 "desktop";
        "wsl-x86_64" = mkSystem systemX86_64 "wsl";
        "jump-x86_64" = mkSystem systemX86_64 "jump";
        "web-x86_64" = mkSystem systemX86_64 "web";
        # aarch64 configurations
        "dev-aarch64" = mkSystem systemAarch64 "dev";
        "desktop-aarch64" = mkSystem systemAarch64 "desktop";
        "wsl-aarch64" = mkSystem systemAarch64 "wsl";
        "jump-aarch64" = mkSystem systemAarch64 "jump";
        "web-aarch64" = mkSystem systemAarch64 "web";
      };
    };
}
