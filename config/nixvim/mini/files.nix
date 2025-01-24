{ ... }: {
  programs.nixvim.plugins.mini.modules.files = {
    options = {
      use_as_default_explorer = false;
    };
  };
}
