{ ... }:

{
  # Enable and configure oh-my-zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      # Load zinit
      if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
        mkdir -p ~/.zinit
        git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
      fi
      source ~/.zinit/bin/zinit.zsh

      # Plugins from ThePrimeagen’s setup
      zinit light zsh-users/zsh-autosuggestions
      zinit light zsh-users/zsh-syntax-highlighting
      zinit light zsh-users/zsh-completions
      zinit light djui/alias-tips
      zinit light agkozak/zsh-z

      # Prompt (powerlevel10k, as in video)
      zinit light romkatv/powerlevel10k
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # Disable flow control so CTRL+Q, CTRL+S can be used for bindings (tmux in ssh)
      stty -ixon
      if [[ -z $TMUX ]]; then
        nerdfetch
      fi
      if ! command -v python3 &> /dev/null; then
        unset -f alias*tips__preexec 2>/dev/null || true
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
