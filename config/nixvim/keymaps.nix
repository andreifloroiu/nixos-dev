{ ... }: {
  programs.nixvim.keymaps = [
    {
      mode = "i";
      action = "<Esc>";
      key = "<C-c>";
    }
    {
      mode = "n";
      action = "<nop>";
      key = "<Space>";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":Ex<CR>";
      key = "<leader>pv";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":UndotreeToggle<CR>";
      key = "<leader>u";
      options = {
        desc = "Undotree Toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      action = ":Git<CR>";
      key = "<leader>gs";
      options.silent = true;
    }
    {
      mode = "v";
      action = ":m '>+1<CR>gv=gv";
      key = "J";
    }
    {
      mode = "v";
      action = ":m '<-2<CR>gv=gv";
      key = "K";
    }
    {
      mode = "x";
      action = "\"_dP";
      key = "<leader>p";
    }
    {
      mode = ["n" "v"];
      action = "[[\"y]]";
      key = "<leader>y";
    }
    {
      mode = "n";
      action = "[[\"Y]]";
      key = "<leader>Y";
    }
    {
      mode = ["n" "v"];
      action = "\"_d";
      key = "<leader>d";
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
      options.silent = true;
    }
    {
      mode = "n";
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<leader>e";
      options.silent = true;
    }
    {
      mode = "n";
      action = "<cmd>cnext<CR>zz";
      key = "<C-k>";
    }
    {
      mode = "n";
      action = "<cmd>cprev<CR>zz";
      key = "<C-j>";
    }
    {
      mode = "n";
      action = ":set list!<CR>";
      key = "<leader>n";
    }
    {
      mode = "n";
      action = "0v$y";
      key = "<leader>l";
      options.desc = "Copy current line";
    }
  ];
}
