{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];

    extraConfigLuaPost = ''
      local ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
      if ok then
        textobjects.setup({
          select = {
            lookahead = true,
          },
          move = {
            set_jumps = true,
          },
        })
      end
    '';

    plugins = {
      treesitter = {
        enable = true;
        autoLoad = true;
        folding.enable = true;
        highlight.enable = true;
        indent.enable = true;
        nixvimInjections = true;
      };
      treesitter-context = {
        enable = true;
        autoLoad = true;
        settings = {
          separator = "─";
        };
      };
      treesitter-textobjects = {
        enable = true;
        autoLoad = true;
      };
      treesj = {
        enable = true;
        autoLoad = true;
        settings = {
          use_default_keymaps = false;
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
