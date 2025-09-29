{ pkgs, ... }:

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
    promptInit = ''
      # Disable flow control so CTRL+Q, CTRL+S can be used for bindings (tmux in ssh)
      stty -ixon
      if [[ -z $TMUX ]]; then
        fastfetch
      fi
    '';
    shellAliases = {
      la = "eza -lh";
      ld = "lazydocker";
      lg = "lazygit";
      lj = "lazyjournal";
      node22 = "nix shell nixpkgs#nodejs_22";
      #node20 = "nix shell nixpkgs#nodejs_20";
      #node18 = "nix shell nixpkgs#nodejs_18";
      myvim = "nvim .";
      mn = "myvim";
      shhh = "sudo shutdown now";
      tk = "tmux kill-session";
    };
  };
}
