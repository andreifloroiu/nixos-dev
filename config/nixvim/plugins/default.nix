{ ... }: {
  programs.nixvim.plugins = {
    bufferline.enable = true;
    dap = {
      enable = true;
      extensions = {
        dap-ui.enable = true;
      };
    };
    fugitive = {
      enable = true;
    };
    lazygit = {
      enable = true;
    };
    lualine = {
      enable = true;
      settings = {
        sections = {
          lualine_b = [ "branch" ];
        };
      };
    };
    lz-n.enable = true;
    neo-tree = {
      enable = true;
      filesystem = {
        useLibuvFileWatcher = true;
      };
    };
    packer.enable = true;
    toggleterm.enable = true;
    transparent.enable = true;
    trouble.enable = true;
    undotree = {
      enable = true;
      autoLoad = true;
    };
    vim-css-color.enable = true;
    web-devicons.enable = true;
    which-key = { 
      enable = true;
      autoLoad = true;
    };
  };
}
