{ ... }: {
  programs.nixvim.plugins.treesitter = {
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
}
