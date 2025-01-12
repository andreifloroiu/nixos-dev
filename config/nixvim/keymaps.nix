{ ... }: {
  programs.nixvim.keymaps = [
    {
      mode = "i";
      action = "<Esc>";
      key = "<C-c>";
    }
    {
      mode = "";
      action = "<nop>";
      key = "<Space>";
      options.silent = true;
    }
    {
      mode = "n";
      action = "<nop>";
      key = "Q";
    }
    {
      mode = "n";
      action = ":Ex<CR>";
      key = "<leader>pv";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":Neotree toggle<CR>";
      key = "<leader>e";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":UndotreeToggle<CR>";
      key = "<leader>u";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":Git<CR>";
      key = "<leader>gs";
      options.silent = true;
    }
    {
      mode = "n";
      action = ":ToggleTerm<CR>";
      key = "<leader>tg";
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
      action = ''
        function()
        require("which-key").show({ global = false })
        end
        '';
      key = "<leader>?";
      lua = true;
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
      key = "<leader>w";

    }
  ]; 
}
