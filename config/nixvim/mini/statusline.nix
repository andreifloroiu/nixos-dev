{ ... }: {
  programs.nixvim.plugins.mini.modules.statusline = {
    use_icons = true;
    set_vim_settings = true;
  };
}
