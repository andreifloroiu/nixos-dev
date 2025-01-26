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
      #csharp_ls.enable = true;
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
      lua-ls.enable = true;
      omnisharp = {
        enable = true;
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true;
            OrganizImports = true;
          };
          RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true;
            EnableImportCompletion = true;
            AnalyzeOpenDocumentsOnly = false;
          };
          Sdk = {
            IncludePrereleases = true;
          };
          EnableRoslynAnalyzers = true;
          EnableSemanticHighlighting = true;
        };
      };
      ts_ls.enable = true;
    };
  };
  programs.nixvim.plugins.lsp-format.enable = true;
}
