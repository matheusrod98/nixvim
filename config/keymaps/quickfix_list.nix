{
  programs.nixvim.keymaps = [
    {
      key = "<leader>Q";
      action = "<cmd>ToggleQuickfix<cr>";
      mode = "n";
      options = {
        desc = "Toggle quickfix list";
        silent = true;
      };
    }
    {
      key = "]q";
      action = "<cmd>cnext<cr>";
      mode = "n";
      options = {
        desc = "Next quickfix item";
        silent = true;
      };
    }
    {
      key = "[q";
      action = "<cmd>cprev<cr>";
      mode = "n";
      options = {
        desc = "Previous quickfix item";
        silent = true;
      };
    }
  ];
}
