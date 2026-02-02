{
  programs.nixvim.keymaps = [
    {
      key = "<C-S-h>";
      action = "<C-w>H";
      mode = "n";
      options = {
        desc = "Move window to the left";
        silent = true;
      };
    }
    {
      key = "<C-S-l>";
      action = "<C-w>L";
      mode = "n";
      options = {
        desc = "Move window to the right";
        silent = true;
      };
    }
    {
      key = "<C-S-j>";
      action = "<C-w>J";
      mode = "n";
      options = {
        desc = "Move window to the lower";
        silent = true;
      };
    }
    {
      key = "<C-S-k>";
      action = "<C-w>K";
      mode = "n";
      options = {
        desc = "Move window to the upper";
        silent = true;
      };
    }
    {
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      mode = "n";
      options = {
        desc = "Increase window height";
        silent = true;
      };
    }
    {
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      mode = "n";
      options = {
        desc = "Decrease window height";
        silent = true;
      };
    }
    {
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      mode = "n";
      options = {
        desc = "Decrease window width";
        silent = true;
      };
    }
    {
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      mode = "n";
      options = {
        desc = "Increase window width";
        silent = true;
      };
    }
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
      options = {
        desc = "Move to left window";
        silent = true;
      };
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
      options = {
        desc = "Move to bottom window";
        silent = true;
      };
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
      options = {
        desc = "Move to top window";
        silent = true;
      };
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
      options = {
        desc = "Move to right window";
        silent = true;
      };
    }
    {
      key = "<leader>v";
      action = "<cmd>vsplit<cr>";
      mode = "n";
      options = {
        desc = "Split window vertically";
        silent = true;
      };
    }
    {
      key = "<leader>s";
      action = "<cmd>split<cr>";
      mode = "n";
      options = {
        desc = "Split window horizontally";
        silent = true;
      };
    }
  ];
}
