{ ... }: {
  programs.nixvim.plugins.mini = {
    enable = true;
    autoLoad = true;
    mockDevIcons = true;
  };
}
