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
      };
      treesitter-context = {
        enable = true;
        lazyLoad.settings = {
          event = "BufReadPost";
        };
        settings = {
          separator = "─";
        };
      };
      treesitter-textobjects = {
        enable = true;
        lazyLoad.settings = {
          event = "BufReadPost";
        };
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
        lazyLoad.settings = {
          cmd = [ "TSJToggle" "TSJSplit" "TSJJoin" ];
        };
        settings = {
          use_default_keymaps = false;
          max_join_length = 10000000;
        };
      };
    };

    highlight = {
      TreesitterContext = {
        bg = "none";
      };
      TreesitterContextSeparator = {
        link = "Comment";
      };
    };
  };
}
