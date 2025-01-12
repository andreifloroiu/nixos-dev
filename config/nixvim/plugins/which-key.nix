{ ... }: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    autoLoad = true;
    settings = {
      spec = [
      ];
    };
  };
}
