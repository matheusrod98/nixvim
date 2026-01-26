{
  keymaps = [
    {
      key = "<leader>Q";
      action = ":lua (function() local windows = vim.fn.getwininfo() for _, win in pairs(windows) do if win['quickfix'] == 1 then vim.cmd.cclose() return end end vim.cmd.copen() end)()<cr>";
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
