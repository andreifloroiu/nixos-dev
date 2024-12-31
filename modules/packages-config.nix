{ config, pkgs, ... }:

{
  # Allow flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set timezone
  time.timeZone = "Europe/Bucharest";

  # Enable nix-ld for running dynamic executables
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
  ];

  environment.systemPackages = with pkgs; [
    atuin
    azure-cli
    bat
    curl
    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_8_0
      sdk_9_0
    ])
    dust
    eza
    fzf
    git
    gh
    google-cloud-sdk
    jq
    lshw
    mc
    neofetch
    neovim
    pandoc
    pdftk
    python3
    python3Packages.virtualenv
    ripgrep
    tldr
    tmux
    wget
    zsh
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
  };
}
