{ config, lib, pkgs, inputs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
  };
  environment.systemPackages = with pkgs; [
    sshd
  ];
}
