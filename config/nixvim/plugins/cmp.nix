{ ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = { 
        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
        { name = "buffer"; }
        { name = "nvim_lsp"; }
        { name = "path"; }
        ];
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
  };
}
