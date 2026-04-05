{
  programs.nixvim.keymaps = [
    {
      key = "[b";
      action = "<cmd>bprevious<cr>";
      mode = "n";
      options = {
        desc = "Previous buffer";
        silent = true;
      };
    }
    {
      key = "]b";
      action = "<cmd>bnext<cr>";
      mode = "n";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
  ];
}
