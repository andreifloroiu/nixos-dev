{ pkgs, ... }:

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

  fonts.packages = [
    pkgs.nerd-fonts.droid-sans-mono
  ];

  networking = {
    enableIPv6 = true;
  };

  # Some packages were inspired from here
  # https://itnext.io/essential-cli-tui-tools-for-developers-7e78f0cd27db
  environment.systemPackages = with pkgs; [
    # Grep for something else
    ast-grep
    # Simple CLI GUI Postman like
    atac
    # Can't remember
    atuin
    # Azure CLI... needed, not wanted
    azure-cli
    # Cause cat is not styled enough
    bat
    # Monitor resources
    btop
    # Can't not have curl
    curl
    # .NET SDKs
    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_8_0
      sdk_9_0
    ])
    # Analyze docker image layers
    dive
    # Tree list occupied space
    dust
    # Better ls
    eza
    # Easy alternative to find
    fd
    # Fuzzy finder
    fzf
    # GIT
    git
    # Github CLI
    gh
    # GCP CLI
    google-cloud-sdk
    # ping but with graph
    gping
    # JSON support in shell
    jq
    # kubectl
    kubectl
    # lazy but for Docker
    lazydocker
    # lazy but for Git
    lazygit
    # ls but for hardware
    lshw
    # A commander because I was raised in the '90s
    mc
    # Cool distro display
    neofetch
    # The new shell
    nushell
    # HTTP load generator
    oha
    # For certificates
    openssl
    pdftk
    python3
    python3Packages.virtualenv
    # grep in rust
    ripgrep
    # delta file sync
    rsync
    # something I need
    seq-cli
    # Spotify player TUI
    spotify-player
    # A super file explorer
    superfile
    # tldr any command instead of man, e.g. tldr fd
    tldr
    # To complete a shell, ya need tmux
    tmux
    # TODOist
    todoist
    # HTTP load testing tool
    vegeta
    # Alternative to curl
    wget
    # Dev alternative to tmux
    zellij
    # An incomplete shell (needs a multiplexer)
    zsh
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
    MC_SKIN = "dark";
  };
 }
