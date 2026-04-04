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
    {
      mode = "n";
      key = "<leader>aa";
      action.__raw = "function() require('sidekick.cli').toggle() end";
      options.desc = "Sidekick Toggle CLI";
    }
    {
      mode = "n";
      key = "<leader>as";
      action.__raw = "function() require('sidekick.cli').select() end";
      options.desc = "Sidekick Select CLI";
    }
    {
      mode = "n";
      key = "<leader>ad";
      action.__raw = "function() require('sidekick.cli').close() end";
      options.desc = "Sidekick Detach CLI";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ap";
      action.__raw = "function() require('sidekick.cli').prompt() end";
      options.desc = "Sidekick Prompt";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>at";
      action.__raw = "function() require('sidekick.cli').send({ msg = '{this}' }) end";
      options.desc = "Sidekick Send This";
    }
    {
      mode = "n";
      key = "<leader>af";
      action.__raw = "function() require('sidekick.cli').send({ msg = '{file}' }) end";
      options.desc = "Sidekick Send File";
    }
    {
      mode = "x";
      key = "<leader>av";
      action.__raw = "function() require('sidekick.cli').send({ msg = '{selection}' }) end";
      options.desc = "Sidekick Send Selection";
    }
    {
      mode = "n";
      key = "<leader>ao";
      action.__raw = "function() require('sidekick.cli').toggle({ name = 'opencode', focus = true }) end";
      options.desc = "Sidekick Toggle OpenCode";
    }
  ];
}
