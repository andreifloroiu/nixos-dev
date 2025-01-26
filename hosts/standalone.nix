{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "../modules/ui-config.nix"
  ];
  networking.hostName = "nixos-standalone"; # Define your hostname.
}
