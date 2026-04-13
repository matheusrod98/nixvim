{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ts";
      action.__raw = ''
        function()
          vim.opt_local.spell = not vim.opt_local.spell:get()
        end
      '';
      options = {
        desc = "Toggle spell";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>Tm";
      action = "<cmd>RenderMarkdown toggle<cr>";
      options = {
        desc = "Toggle markdown render";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>trn";
      action.__raw = ''
        function()
          vim.opt_local.relativenumber = not vim.opt_local.relativenumber:get()
        end
      '';
      options = {
        desc = "Toggle relative number";
        silent = true;
      };
    }
  ];
}
