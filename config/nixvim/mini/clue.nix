{ ... }: {
  programs.nixvim.plugins.mini.modules.clue = {
    # clues = ''
    #   -- Enhance this by adding descriptions for <Leader> mapping groups
    #   miniclue.gen_clues.builtin_completion(),
    #   miniclue.gen_clues.g(),
    #   miniclue.gen_clues.marks(),
    #   miniclue.gen_clues.registers(),
    #   miniclue.gen_clues.windows(),
    #   miniclue.gen_clues.z(),
    # '';
    triggers = [
      { mode = "n"; keys = "<leader>"; }
      { mode = "n"; keys = "g"; }
      { mode = "n"; keys = "<C-w>"; }
    ];
  };
}
