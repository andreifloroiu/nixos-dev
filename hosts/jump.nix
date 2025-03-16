{ config, lib, pkgs, inputs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
  };
  # Add your SSH keys here
  users.users.andrei = {
    isNormalUser = true;
    extraGroups = [ "wheel" "podman" ];  # Add user to podman group
    openssh.authorizedKeys.keyFiles = [
      ./.env/ssh-keys/andrei.pub
    ];
  };

}
