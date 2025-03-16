{ pkgs, lib, ... }:
{
  # SSH configuration
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
      LogLevel = "VERBOSE";
    };
  };
  # Podman configuration
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = with pkgs; [
    podman-tui
    docker-compose
    dive
  ];
}
