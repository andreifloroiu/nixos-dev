{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "../config/ui-config.nix"
  ];
  networking.hostName = "nixos-standalone"; # Define your hostname.
}
