{
  programs.nixvim.keymaps = [
    {
      key = "<leader>L";
      action.__raw = "function() _G.toggle_location_list() end";
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
