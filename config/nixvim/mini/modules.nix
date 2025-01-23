{ ... }: {
  programs.nixvim.plugins.mini.modules = {
    ai = { };
    align = { };
    basics = { };
    bracketed = { };
    bufremove = { };
    clue = { };
    colors = { };
    comment = { };
    completion = { };
    diff = { };
    doc = { };
    extra = { };
    files = {
      options = {
        use_as_default_explorer = false;
      };
    };
    fuzzy = { };
    git = { };
    icons = { };
    indentscope = { };
    jump = { };
    jump2d = { };
    map = { };
    misc = { };
    move = { };
    notify = { };
    operators = { };
    pairs = { };
    pick = { };
    snippets = { };
    splitjoin = { };
    starter = { };
    statusline = { };
    surround = { };
    tabline = { };
    test = { };
    trailspace = { };
    visits = { };
  };
}
