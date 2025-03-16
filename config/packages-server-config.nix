{ pkgs, ... }:

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
  environment.systemPackages = with pkgs; [
    podman-tui
    docker-compose
    dive
  ];
}
