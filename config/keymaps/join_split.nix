{
  keymaps = [
    {
      mode = "n";
      key = "gm";
      action = "<cmd>TSJToggle<cr>";
      options = {
        desc = "Toggle join/split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gs";
      action = "<cmd>TSJSplit<cr>";
      options = {
        desc = "Split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gj";
      action = "<cmd>TSJJoin<cr>";
      options = {
        desc = "Join";
        silent = true;
      };
    }
  ];
}
