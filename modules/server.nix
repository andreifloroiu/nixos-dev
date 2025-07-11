{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./base.nix
  ];
  boot.loader = {
    systemd-boot.enable = lib.mkDefault true;
    efi.canTouchEfiVariables = lib.mkDefault true;
  };
  environment.systemPackages = with pkgs; [
    # Azure CLI... needed, not wanted
    azure-cli
    # Analyse docker images
    dive
    # Github CLI
    gh
    # GCP CLI
    google-cloud-sdk
    # ping but with graph
    gping
    # docker-compose easier then k8s
    docker-compose
    # kubectl
    kubectl
    # lazy but for Docker
    lazydocker
    # For certificates
    openssl
    # TUI for podman
    podman-tui
    # delta file sync
    rsync
    # tldr any command instead of man, e.g. tldr fd
    tldr
  ];
  environment.sessionVariables = {
    MC_SKIN = "dark";
  };

  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  networking = {
    firewall = {
      allowedTCPPorts = [ 22 ];
    };
  };
  # Configure fail2ban
  services = {
    fail2ban = {
      enable = lib.mkDefault true;
      maxretry = lib.mkDefault 10;
      ignoreIP = [
        "127.0.0.1/8"
      ];
      bantime = lib.mkDefault "1h";
      bantime-increment = {
        enable = lib.mkDefault true;
        formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
        multipliers = "1 2 4 8 16 32 64";
        maxtime = "168h";
        overalljails = true;
      };
    };
    openssh = {
      #enable = lib.mkDefault true;
      settings = {
        PermitRootLogin = lib.mkDefault "no";
        PasswordAuthentication = lib.mkDefault false;
      };
    };
  };
  # Podman configuration
  virtualisation.containers.enable = lib.mkDefault true;
  virtualisation.podman = {
    enable = lib.mkDefault true;
    dockerCompat = lib.mkDefault true;
    defaultNetwork.settings.dns_enabled = lib.mkDefault true;
  };
}
