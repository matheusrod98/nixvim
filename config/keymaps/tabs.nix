{
  programs.nixvim.keymaps = [
    {
      key = "[t";
      action = "<cmd>tabprevious<cr>";
      mode = "n";
      options = {
        desc = "Previous tab";
        silent = true;
      };
    }
    {
      key = "]t";
      action = "<cmd>tabnext<cr>";
      mode = "n";
      options = {
        desc = "Next tab";
        silent = true;
      };
    }
  ];
}
