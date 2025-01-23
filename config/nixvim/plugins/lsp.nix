{ ... }: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic = {
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
      };
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
    };
    servers = {
      clangd.enable = true;
      csharp_ls.enable = true;
      dockerls.enable = true;
      eslint.enable = true;
      html.enable = true;
      htmx.enable = true;
      nil_ls = {
        enable = true;
        settings = {
          autoArchive = true;
        };
      };
      omnisharp = {
        enable = true;
        settings = {
          enableImportCompletion = true;
          enableMsBuildLoadProjectsOnDemand = true;
          enableRoslynAnalyzers = true;
          analyzeOpenDocumentsOnly = false;
          enableSemanticHighlighting = true;
        };
      };
      ts_ls.enable = true;
    };
  };
  programs.nixvim.plugins.lsp-format.enable = true;
}
