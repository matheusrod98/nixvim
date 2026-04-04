{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins = {
      treesitter = {
        enable = true;
        folding.enable = true;
        highlight.enable = true;
        indent.enable = true;
        nixvimInjections = true;
        settings = {
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<Tab>";
              node_incremental = "<Tab>";
              scope_incremental = "<S-Tab>";
              node_decremental = "<BS>";
            };
          };
        };
      };
      treesitter-context = {
        enable = true;
        settings = {
          separator = "─";
        };
      };
      treesitter-textobjects = {
        enable = true;
        settings = {
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
            swap_next = {
              "gp" = "@parameter.inner";
            };
            swap_previous = {
              "gP" = "@parameter.inner";
            };
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

    highlightOverride = {
      TreesitterContext = {
        bg = "none";
      };
      TreesitterContextLineNumber = {
        bg = "none";
      };
      TreesitterContextBottom = {
        bg = "none";
      };
      TreesitterContextLineNumberBottom = {
        bg = "none";
      };
      TreesitterContextSeparator = {
        link = "Comment";
      };
    };
  };
}
