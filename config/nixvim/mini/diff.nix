{ ... }: {
  programs.nixvim.plugins.mini.modules.diff = {
    view = {
      style = "number";
    };
  };
}
