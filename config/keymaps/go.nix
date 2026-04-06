{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>Gt";
      action = "<cmd>GoTest<cr>";
      options = {
        desc = "Go: Run test";
        silent = true;
      };
    }
  ];
}
