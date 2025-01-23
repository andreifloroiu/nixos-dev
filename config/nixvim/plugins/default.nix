{ ... }: {
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      extensions = {
        dap-ui.enable = true;
      };
    };
    neo-tree = {
      enable = true;
      filesystem = {
        useLibuvFileWatcher = true;
        filteredItems = {
          visible = true;
          hideDotfiles = false;
          hideGitignored = true;
          hideHidden = true;
        };
      };
    };
    trouble.enable = true;
    undotree = {
      enable = true;
      autoLoad = true;
    };
    web-devicons.enable = true;
  };
}
