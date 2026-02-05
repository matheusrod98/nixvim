{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>Undotree<cr>";
      options = {
        desc = "Toggle undotree";
        silent = true;
      };
    }
  ];
}
