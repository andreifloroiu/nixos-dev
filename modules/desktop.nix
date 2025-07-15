{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./base.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = lib.mkDefault true;
    efi.canTouchEfiVariables = lib.mkDefault true;
  };

  # Select internationalisation properties.
  console.keyMap = lib.mkDefault "us";

  environment.systemPackages = with pkgs; [
    alacritty
    ccid
    chromium
    dunst
    freerdp
    gnutls
    google-chrome
    gpa
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ro_RO
    kitty
    libnotify
    libreoffice-qt
    nss
    opensc
    opera
    p11-kit
    pandoc
    pcsc-lite
    pcsc-tools
    remmina
    rofi-wayland
    swww
    vscode
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    wezterm
    wget
  ];

  programs = {
    firefox.enable = lib.mkDefault true;
    hyprland = {
      enable = lib.mkDefault true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      nvidiaPatches = lib.mkDefault true;
      xwayland.enable = lib.mkDefault true;
    };
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  xdg.portal = {
    enable = lib.mkDefault true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  security.rtkit.enable = lib.mkDefault true;
  # Enable wayland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    };
  };

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = lib.mkDefault true;
  # Enable sound with pipewire.
  sound.enable = true;
  services.pipewire = {
    enable = lib.mkDefault true;
    alsa.enable = lib.mkDefault true;
    alsa.support32Bit = lib.mkDefault true;
    pulse.enable = lib.mkDefault true;
    jack.enable = lib.mkDefault true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.andrei = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "pcscd"
      "plugdev"
      "video"
      "wheel"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Enable Bluetooth
  hardware.bluetooth.enable = lib.mkDefault true;
  hardware.bluetooth.powerOnBoot = lib.mkDefault true;
  services.blueman.enable = lib.mkDefault true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
