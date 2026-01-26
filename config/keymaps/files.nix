{
  keymaps = [
    {
      key = "-";
      action = "<cmd>Oil<cr>";
      mode = "n";
      options = {
        desc = "Open Oil";
        silent = true;
      };
    }
    {
      key = "<leader>f";
      action = ":find ";
      mode = "n";
      options = {
        desc = "Find file";
        silent = true;
      };
    }
    {
      key = "<leader>g";
      action = ":grep ";
      mode = "n";
      options = {
        desc = "Grep in files";
        silent = true;
      };
    }
  ];
}
