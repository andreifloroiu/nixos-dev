{ ... }: {

  #
  # cmp (autocomplete) keymaps are in cmp.nix and it would like bellow
  #
  # "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
  # "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
  # "<C-y>" = "cmp.mapping.confirm({ select = true })";
  # "<C-f>" = "cmp.mapping.complete()";
  # "<CR>" = "cmp.mapping.confirm({ select = true })";

  programs.nixvim.keymaps = [
    {
      mode = "i";
      action = "<Esc>";
      key = "<C-c>";
      options = {
        desc = "Set CTRL+C the same as Escape action";
      };
    }
    {
      mode = "n";
      action = "<nop>";
      key = "<Space>";
      options = {
        desc = "Remove <Space> key map";
        silent = true;
      };
    }
    {
      mode = "n";
      action = "<cmd>bdelete<bar>b#<CR>";
      key = "<leader>q";
      options = {
        desc = "Closes current buffere (:bdelete)";
        silent = true;
      };
    }
    {
      mode = "n";
      action = ":Ex<CR>";
      key = "<leader>pv";
      options = {
        desc = "Open NetRW";
        silent = true;
      };
    }
    {
      mode = "n";
      action = ":UndotreeToggle<CR>";
      key = "<leader>u";
      options = {
        desc = "Undotree toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      action = ":Git<CR>";
      key = "<leader>gs";
      options = {
        silent = true;
      };
    }
    {
      mode = "v";
      action = ":m '>+1<CR>gv=gv";
      key = "J";
      options.desc = "Moves text selection down";
    }
    {
      mode = "v";
      action = ":m '<-2<CR>gv=gv";
      key = "K";
      options.desc = "Moves text selection up";
    }
    {
      mode = "x";
      action = "\"_dP";
      key = "<leader>p";
      options.desc = "Delete and paste from the black hole register";
    }
    {
      mode = ["n" "v"];
      action = "[[\"y]]";
      key = "<leader>y";
      options.desc = "Yanks the text that is selected by the motion command that follows, of the previous function or block";
    }
    {
      mode = "n";
      action = "[[\"Y]]";
      key = "<leader>Y";
      options.desc = "Yanks the entire line of the previous function or block";
    }
    {
      mode = ["n" "v"];
      action = "\"_d";
      key = "<leader>d";
      options.desc = "Delete into the black hole register";
    }
    {
      mode = "n";
      action = "vim.lsp.buf.format";
      key = "<leader>f";
      lua = true;
      options.silent = true;
    }
    {
      mode = "n";
      action = "MiniFiles.open";
      key = "<leader>w";
      lua = true;
      options = {
        desc = "Open mini.files";
        silent = true;
      };
    }
    {
      mode = "n";
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<leader>e";
      options = {
        desc = "Toggle NvimTree";
        silent = true;
      };
    }
    {
      mode = "n";
      action = "<cmd>cnext<CR>zz";
      key = "<C-k>";
      options.desc = "Navigate to the previous error";
    }
    {
      mode = "n";
      action = "<cmd>cprev<CR>zz";
      key = "<C-j>";
      options.desc = "Navigate to the next error";
    }
    {
      mode = "n";
      action = ":set list!<CR>";
      key = "<leader>n";
      options.desc = "Toggle display of white spaces";
    }
    {
      mode = "n";
      action = "0v$y";
      key = "<leader>l";
      options.desc = "Copy current line";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>b#<cr>";
      options.desc = "Previous buffer";
    }
  ];
}
