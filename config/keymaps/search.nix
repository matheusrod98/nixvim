{
  programs.nixvim.keymaps = [
    {
      key = "<Esc>";
      action.__raw = ''
        function()
          vim.cmd("nohlsearch")
          require("sidekick.nes").clear()
        end
      '';
      mode = "n";
      options = {
        desc = "Clear search highlight and NES";
        silent = true;
      };
    }
    {
      key = "<Tab>";
      action.__raw = ''
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>"
          end
        end
      '';
      mode = "n";
      options = {
        desc = "Accept/jump NES or fallback";
        silent = true;
        expr = true;
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
