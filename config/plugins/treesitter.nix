{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    tree-sitter
  ];

  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<cr>";
            node_incremental = "<cr>";
            node_decremental = "<bs>";
            scope_incremental = "<tab>";
          };
        };
        folding = true;
        nixvimInjections = true;
      };
    };
    treesitter-context = {
      enable = true;
    };
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "as" = "@local.scope";
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "gp" = "@parameter.inner";
        };
        swapPrevious = {
          "gP" = "@parameter.inner";
        };
      };
    };
    treesj = {
      enable = true;
      settings = {
        use_default_keymaps = false;
        max_join_length = 10000000;
      };
    };
  };
}
