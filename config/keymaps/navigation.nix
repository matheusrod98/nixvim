{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "[c";
      action.__raw = ''function() require("treesitter-context").go_to_context(vim.v.count1) end'';
      options = {
        desc = "Go to context";
        silent = true;
      };
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = "n";
      options = {
        desc = "Half page down (centered)";
        silent = true;
      };
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = "n";
      options = {
        desc = "Half page up (centered)";
        silent = true;
      };
    }
    {
      key = "<C-b>";
      action = "<C-b>zz";
      mode = "n";
      options = {
        desc = "Full page up (centered)";
        silent = true;
      };
    }
    {
      key = "<C-f>";
      action = "<C-f>zz";
      mode = "n";
      options = {
        desc = "Full page down (centered)";
        silent = true;
      };
    }
  ];
}
