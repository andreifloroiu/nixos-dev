{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "../config/ui-config.nix"
  ];
  networking.hostName = "nixos-standalone"; # Define your hostName
  system.stateVersion = "24.11";
}
