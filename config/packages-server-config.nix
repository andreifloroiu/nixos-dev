{ config, pkgs, ... }:

{
  # Configure firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 443 ];
  };
  # Configure ssh
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
      LogLevel = "VERBOSE";
    };
    hostKeys = [
      {
        path = ../.env/secrets/ssh-keys/host_key;
        type = "rsa";
      }
    ];
  };
  # Configure fail2ban
  services.fail2ban = {
    enable = true;
    maxretry = 10;
    ignoreIP = [
      "127.0.0.1/8"
    ];
    bantime = "1h";
    bantime-increment = {
      enable = true;
      formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h";
      overalljails = true;
    };
  };
  # Podman configuration
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  # Server packages
  environment.systemPackages = with pkgs; [
    podman-tui
    docker-compose
    dive
  ];
}
