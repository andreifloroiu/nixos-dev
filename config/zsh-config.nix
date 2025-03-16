{ config, pkgs, ... }:

{
  # Enable and configure oh-my-zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
      	"git"
        "sudo"
        "systemadmin"
        "vi-mode"
      ];
      theme = "re5et";
    };
    interactiveShellInit = "
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
      plugins=(git sudo systemadmin vi-mode)
      source $ZSH/oh-my-zsh.sh
    ";
    promptInit = "";
    shellAliases = {
      la = "eza -lh";
      node22 = "nix shell nixpkgs#nodejs_22";
      #node20 = "nix shell nixpkgs#nodejs_20";
      #node18 = "nix shell nixpkgs#nodejs_18";
      mymux = "tmux";
      myvim = "nvim .";
      shhh = "sudo shutdown now";
    };
  };
}
