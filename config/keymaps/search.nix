{
  programs.nixvim.keymaps = [
    {
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      mode = "n";
      options = {
        desc = "Clear search highlight";
        silent = true;
      };
    }
    {
      key = "n";
      action = "nzzzv";
      mode = "n";
      options = {
        desc = "Next search result (centered)";
        silent = true;
      };
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = "n";
      options = {
        desc = "Previous search result (centered)";
        silent = true;
      };
    }
    {
      key = "]r";
      action.__raw = ''function() Snacks.words.jump(vim.v.count1) end'';
      mode = "n";
      options = {
        desc = "Next reference";
        silent = true;
      };
    }
    {
      key = "[r";
      action.__raw = ''function() Snacks.words.jump(-vim.v.count1) end'';
      mode = "n";
      options = {
        desc = "Previous reference";
        silent = true;
      };
    }
  ];
}
