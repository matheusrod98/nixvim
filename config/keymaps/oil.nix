{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options = {
        desc = "Open parent directory in Oil";
        silent = true;
      };
    }
  ];
}
