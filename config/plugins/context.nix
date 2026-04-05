{
  programs.nixvim = {
    plugins.treesitter-context = {
      enable = true;
      autoLoad = true;
      settings = {
        separator = "─";
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
