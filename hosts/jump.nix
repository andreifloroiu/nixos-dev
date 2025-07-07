{ config, pkgs, ... }:

let
  webConfig = import ./web.nix { inherit config pkgs; };
in
webConfig
// {
  networking.hostName = "jump";
}
