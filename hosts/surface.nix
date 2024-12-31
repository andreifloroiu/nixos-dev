{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "../modules/ui-config.nix"
    "../modules/surface-hw-config.nix"
  ];
  
  networking.hostName = "af-surface"; # Define your hostname.
}