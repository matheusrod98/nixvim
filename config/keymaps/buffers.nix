{
  programs.nixvim.keymaps = [
    {
      key = "<leader>w";
      action = "<cmd>update<cr>";
      mode = [ "n" ];
      options = {
        desc = "Save current buffer";
        silent = true;
      };
    }
    {
      key = "<leader>W";
      action = "<cmd>bufdo update<cr>";
      mode = [ "n" ];
      options = {
        desc = "Save all buffers";
        silent = true;
      };
    }
    {
      key = "<leader>q";
      action = "<cmd>quit<cr>";
      mode = "n";
      options = {
        desc = "Quit window";
        silent = true;
      };
    }
    {
      key = "<leader>=";
      action = "gg=G``";
      mode = "n";
      options = {
        desc = "Format buffer (fallback)";
        silent = true;
      };
    }
    {
      key = "[b";
      action = "<cmd>bprevious<cr>";
      mode = "n";
      options = {
        desc = "Previous buffer";
        silent = true;
      };
    }
    {
      key = "]b";
      action = "<cmd>bnext<cr>";
      mode = "n";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
  ];
}
