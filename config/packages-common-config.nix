{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  fonts.packages = [
    pkgs.nerd-fonts.droid-sans-mono
  ];

  networking = {
    enableIPv6 = true;
  };

  environment.systemPackages = with pkgs; [
    # Grep for something else
    ast-grep
    # Simple CLI GUI Postman like
    atac
    # Can't remember
    atuin
    # Cause cat is not styled enough
    bat
    # Monitor resources
    btop
    # Can't not have curl
    curl
    # Analyze docker image layers
    dive
    # Disk utility
    duf
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
    # JSON support in shell
    jq
    # lazy but for Git
    lazygit
    # ls but for hardware
    lshw
    # A commander because I was raised in the '90s
    mc
    # Another disk utility
    ncdu
    # Cool distro display
    neofetch
    # The new shell
    nushell
    # A super file explorer
    superfile
    # grep in rust
    ripgrep
    # To complete a shell, ya need tmux
    tmux
    # Alternative to curl
    wget
    # Dev alternative to tmux
    zellij
    # An incomplete shell (needs a multiplexer)
    zsh
  ];

}
