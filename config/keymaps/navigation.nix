{
  programs.nixvim.keymaps = [
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
