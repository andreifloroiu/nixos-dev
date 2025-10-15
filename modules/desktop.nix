{ pkgs, ... }:
{
  imports = [
    ./development.nix
  ];

  environment.systemPackages = with pkgs; [
    # terminals
    alacritty
    foot
    kitty
    # browsers
    brave
    chromium
    firefox
  ];
}
