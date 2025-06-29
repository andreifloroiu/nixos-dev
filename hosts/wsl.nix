{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    inputs.vscode-server.nixosModule
  ];

  wsl = {
    enable = true;
    defaultUser = "andrei";
    docker-desktop = {
      enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };

  services.vscode-server.enable = true;

  # Get latest from here https://github.com/nix-community/NixOS-WSL/releases
  system.stateVersion = "24.11";
}
