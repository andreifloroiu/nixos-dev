{ lib, pkgs, ... }:

{
  imports = [
    ./colorschemes.nix
    ./globals.nix
    ./keymaps.nix
    ./lua.nix
    ./opts.nix
  ] ++ (lib.filesystem.listFilesRecursive ./plugins);
  programs.nixvim = {
    enable = true;
    autoCmd = [
      {
        event = ["FileType"];
        pattern = [ "cs" "csproj" ];
        command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab";
      }
    ];
    plugins = {
          };
    extraPackages = with pkgs; [
      cargo
      dotnet-sdk
      gcc
      netcoredbg
      nil
      nodejs
      nodePackages.prettier
      nodePackages.vscode-langservers-extracted
      rust-analyzer
      rustc
      omnisharp-roslyn
      vscode-js-debug
    ];
  };
}
