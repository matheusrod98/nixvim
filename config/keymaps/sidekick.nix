{
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''
        function()
          if require("sidekick").nes_jump_or_apply() then
            return ""
          end
          if vim.fn.pumvisible() == 1 then
            return "<C-n>"
          end
          return "<Tab>"
        end
      '';
      options = {
        desc = "Next edit or next completion";
        expr = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<S-Tab>";
      action.__raw = ''
        function()
          if vim.fn.pumvisible() == 1 then
            return "<C-p>"
          end
          return "<S-Tab>"
        end
      '';
      options = {
        desc = "Previous completion";
        expr = true;
        silent = true;
      };
    }
  ];
}
