{ config, lib, pkgs, inputs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
