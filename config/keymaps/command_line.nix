{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>fw";
      action = ":grep! <C-r><C-w><CR>";
      options.desc = "Current word";
    }
  ];
}
