{
  config,
  pkgs,
  lib,
  ...
}:
let
  # Helper function to check if a package is available
  hasPackage =
    pkg: builtins.any (p: p.pname or p.name or "" == pkg) config.environment.systemPackages;
  # Language server availability checks
  hasDotnetSdk = hasPackage "dotnet" || hasPackage "dotnet-sdk" || hasPackage "dotnet-sdk_8";
  hasNodejs = hasPackage "nodejs";
  hasPython = hasPackage "python3";
  hasGo = hasPackage "go";
  hasJava = hasPackage "openjdk" || hasPackage "jdk";
in
{
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
      bashls.enable = true;
      clangd.enable = true;
      cssls.enable = lib.mkDefault hasNodejs;
      dockerls.enable = true;
      eslint.enable = lib.mkDefault hasNodejs;
      gopls = {
        enable = lib.mkDefault hasGo;
        settings = {
          gofumpt = true;
          staticcheck = true;
          usePlaceholders = true;
        };
      };
      html.enable = lib.mkDefault hasNodejs;
      htmx.enable = lib.mkDefault hasNodejs;
      java_language_server.enable = lib.mkDefault hasJava;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nil_ls = {
        enable = true;
        settings = {
          autoArchive = true;
        };
      };
      omnisharp = {
        enable = lib.mkDefault hasDotnetSdk;
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
      pylsp = {
        #enable = lib.mkDefault hasPython;
        enable = false;
        settings = {
          plugins = {
            pycodestyle.enabled = false;
            mccabe.enabled = false;
            pyflakes.enabled = false;
            flake8.enabled = true;
            autopep8.enabled = false;
            yapf.enabled = false;
            black.enabled = true;
            isort.enabled = true;
            mypy.enabled = true;
          };
        };
      };
      #ts_ls.enable = lib.mkDefault hasNodejs;
      yamlls.enable = true;
    };
  };
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    trouble = {
      enable = true;
      settings = {
        auto_open = false;
        auto_close = true;
      };
    };
  };
}
