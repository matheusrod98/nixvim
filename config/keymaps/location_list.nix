{
  keymaps = [
    {
      key = "<leader>L";
      action = ":lua (function() local windows = vim.fn.getwininfo() for _, win in pairs(windows) do if win['loclist'] == 1 then vim.cmd.lclose() return end end vim.cmd.lopen() end)()<cr>";
      mode = "n";
      options = {
        desc = "Toggle location list";
        silent = true;
      };
    }
    {
      key = "]l";
      action = "<cmd>lnext<cr>";
      mode = "n";
      options = {
        desc = "Next location list item";
        silent = true;
      };
    }
    {
      key = "[l";
      action = "<cmd>lprev<cr>";
      mode = "n";
      options = {
        desc = "Previous location list item";
        silent = true;
      };
    }
  ];
}
