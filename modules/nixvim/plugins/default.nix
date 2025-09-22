{ ... }:
{
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  programs.nixvim.plugins = {
    dap = {
      enable = true;
    };
    dap-ui.enable = true;
    nvim-tree = {
      enable = true;
      settings = {
        autoClose = false;
        autoReloadOnWrite = true;
        disableNetrw = false;
        hijackCursor = false;
        hijackNetrw = true;
        hijackUnnamedBufferWhenOpening = true;
        ignoreBufferOnSetup = false;
        openOnSetup = true;
        view = {
          width = 50;
        };
      };
    };
    undotree = {
      enable = true;
      autoLoad = true;
    };
    web-devicons.enable = true;
  };
}
