{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>OverseerToggle<cr>";
      options = {
        desc = "Toggle Overseer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>or";
      action = "<cmd>OverseerRun<cr>";
      options = {
        desc = "Run Overseer task";
        silent = true;
      };
    }
  ];
}
