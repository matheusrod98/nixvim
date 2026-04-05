{
  programs.nixvim.keymaps = [
    {
      key = "<leader>cp";
      action.__raw = "function() _G.copy_relative_path(false) end";
      mode = "n";
      options = {
        desc = "Copy relative file path to clipboard";
        silent = true;
      };
    }
    {
      key = "<leader>cl";
      action.__raw = "function() _G.copy_relative_path(true) end";
      mode = "n";
      options = {
        desc = "Copy relative file path with line number to clipboard";
        silent = true;
      };
    }
  ];
}
