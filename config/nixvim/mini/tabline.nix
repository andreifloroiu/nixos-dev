{ ... }: {
  programs.nixvim.plugins.mini.modules.tabline = {
    show_icons = true;
    format = null;
    set_vim_settings = true;
    tabpage_selection = true;
  };
}
