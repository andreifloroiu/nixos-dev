{ config, lib, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;
    autoCmd = [
      {
        event = ["FileType"];
        pattern = [ "cs" "csproj" ];
        command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab";
      }
    ];
    colorschemes.catppuccin.enable = true;
    #colorschemes.gruvbox.enable = true;
    #colorschemes.onedark.enable = true;
    #colorschemes.rose-pine.enable = true;
    #colorschemes.tokyonight.enable = true;
    globals = {
      mapleader = " ";
    };
    keymaps = [
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
    opts = {
      backup = true;
      colorcolumn = "120";
      cursorline = true;
      expandtab = true;
      hlsearch = false;
      #guicursor = "";
      incsearch = true;
      list = true;
      listchars = "space:·,tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨";
      nu = true;
      number = true;
      relativenumber = true;
      scrolloff = 8;
      signcolumn = "yes";
      shiftwidth = 4;
      softtabstop = 4;
      swapfile = false;
      smartindent = true;
      tabstop = 4;
      termguicolors = true;
      undofile = true;
      updatetime = 50;
      wrap = false;
    };
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = { 
          mapping = {
            "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
            "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            { name = "buffer"; }
            { name = "nvim_lsp"; }
            { name = "path"; }
          ];
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      dap = {
        enable = true;
        extensions = {
          dap-ui.enable = true;
        };
      };
      fugitive = {
	      enable = true;
      };
      lazy = {
        enable = true;
        plugins = [
          
        ];
      };
      lazygit = {
        enable = true;
      };
      lsp = {
        enable = true;
	      keymaps = {
	        diagnostic = {
	          "<leader>j" = "goto_next";
	          "<leader>k" = "goto_prev";
          };
	        lspBuf = {
	          K = "hover";
	          gD = "references";
	          gd = "definition";
	          gi = "implementation";
	          gt = "type_definition";
	        };
	      };
        servers = {
	        clangd.enable = true;
	        dockerls.enable = true;
	        eslint.enable = true;
	        html.enable = true;
	        nil_ls = {
            enable = true;
            settings = {
              autoArchive = true;
            };
          };
          omnisharp = {
	          enable = true;
	          settings = {
	            enableImportCompletion = true;
	            enableMsBuildLoadProjectsOnDemand = true;
	            enableRoslynAnalyzers = true;
	            analyzeOpenDocumentsOnly = false;
	            enableSemanticHighlighting = true;
	          };
	        };
	        rust_analyzer = {
	          enable = true;
	          installCargo = true;
	          installRustc = true;
	        };
          ts_ls.enable = true;
        };
      };
      lsp-format.enable = true;
      lualine = {
        enable = true;
        settings = {
          sections = {
            lualine_b = [ "branch" ];
          };
        };
      };
      neo-tree = {
        enable = true;
      };
      packer.enable = true;
      telescope = {
        enable = true;
        autoLoad = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
        extensions = {
          file-browser = {
            settings = {
              hidden = true;
              respect_git_ignore = true;
            };
          };
        };
        settings = {
          defaults = {
            file_ignore_patterns = [
              ".git/"
              "[Bb]in/"
              "[Oo]bj/"
              "*~"
            ];
            hidden = true;
          };
          pickers = {
            find_files = {
              hidden = true;
            };
            grep_string = {
              additionl_args = [ "--hidden" ];
            };
            live_grep = {
              additionl_args = [ "--hidden" ];
            };
          };
        };
      };
      transparent.enable = true;
      treesitter = {
	      enable = true;
	      settings = { 
          additional_vim_regex_highlighting = false;
          autoinstall = true;
	        highlight.enable = true;
	        ensure_installed = [ 
            "bash"
            "c"
            "cpp"
            "c_sharp"
            "dockerfile"
            "git_config"
            "git_rebase"
            "gitattributes"
            "gitcommit"
            "gitignore"
            "html"
            "javascript"
            "json"
            "lua"
            "markdown"
            "markdown_inline"
            "nix"
            "python"
            "query"
            "regex"
            "rust"
            "tsx"
            "typescript"
            "sql"
            "vim"
            "yaml"
          ];
	      };
      };
      trouble.enable = true;
      toggleterm = {
        enable = true;
      };
      undotree = {
	      enable = true;
	      autoLoad = true;
      };
      vim-css-color.enable = true;
      web-devicons.enable = true;
      which-key = { 
        enable = true;
        autoLoad = true;
      };
    };
    extraPackages = with pkgs; [
      cargo
      dotnet-sdk
      gcc
      netcoredbg
      nil
      nodejs
      nodePackages.prettier
      nodePackages.vscode-langservers-extracted
      rust-analyzer
      rustc
      omnisharp-roslyn
      vscode-js-debug
    ];
    extraConfigLua = ''
    '';
  };
}
