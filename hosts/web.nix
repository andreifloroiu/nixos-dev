{ config, pkgs, ... }:
{
  # Add your SSH keys here
  users.users.andrei = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "podman"
    ]; # Add user to podman group
    openssh.authorizedKeys.keyFiles = [
      ./.env/secrets/ssh-keys/andrei.pub
    ];
  };
}
