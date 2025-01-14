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

  # Some packages were inspired from here 
  # https://itnext.io/essential-cli-tui-tools-for-developers-7e78f0cd27db
  environment.systemPackages = with pkgs; [
    ast-grep
    # Simple CLI GUI Postman like
    atac
    atuin
    azure-cli
    # Cause cat is not styled enough
    bat
    # Monitor resources
    btop
    curl
    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_8_0
      sdk_9_0
    ])
    # Analyze docker image layers
    dive
    dust
    eza
    fd
    fzf
    git
    # Github CLI
    gh
    # GCP CLI
    google-cloud-sdk
    # ping but with graph
    gping
    jq
    kubectl
    # lazy but for Docker
    lazydocker
    # lazy but for Git
    lazygit
    lshw
    # A commander because I was raised in the '90s
    mc
    # Cool distro display
    neofetch
    openssl
    pandoc
    pdftk
    python3
    python3Packages.virtualenv
    ripgrep
    rsync
    tldr
    tmux
    todoist
    # HTTP load testing tool
    vegeta
    wget
    zsh
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
    MC_SKIN = "dark";
  };
}
