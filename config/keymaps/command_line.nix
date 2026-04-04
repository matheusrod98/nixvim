{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = ''function() require("mini.pick").builtin.resume() end'';
      options = {
        desc = "Resume picker";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = ''function() require("mini.pick").builtin.files() end'';
      options = {
        desc = "Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = ''function() require("mini.pick").builtin.buffers() end'';
      options = {
        desc = "Buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = ''function() require("mini.pick").builtin.grep_live() end'';
      options = {
        desc = "Live grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fG";
      action.__raw = ''function() require("mini.pick").builtin.grep() end'';
      options = {
        desc = "Grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action.__raw = ''
        function()
          local word = vim.fn.expand('<cword>')
          if word == "" then word = nil end
          require("mini.pick").builtin.grep({ pattern = word })
        end
      '';
      options = {
        desc = "Grep current word";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = ''function() require("mini.pick").builtin.help() end'';
      options = {
        desc = "Help tags";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''function() require("mini.extra").pickers.registers() end'';
      options = {
        desc = "Registers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action.__raw = ''function() require("mini.extra").pickers.keymaps() end'';
      options = {
        desc = "Keymaps";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = ''function() require("mini.extra").pickers.marks() end'';
      options = {
        desc = "Marks";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fM";
      action.__raw = ''function() require("mini.extra").pickers.manpages() end'';
      options = {
        desc = "Man pages";
        silent = true;
      };
    }
  ];
}
