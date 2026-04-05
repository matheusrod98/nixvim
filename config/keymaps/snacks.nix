{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = ''function() Snacks.picker.resume() end'';
      options = {
        desc = "Resume picker";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = ''function() Snacks.picker.files() end'';
      options = {
        desc = "Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = ''function() Snacks.picker.buffers() end'';
      options = {
        desc = "Buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lg";
      action.__raw = ''function() Snacks.picker.grep() end'';
      options = {
        desc = "Live grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lG";
      action.__raw = ''function() Snacks.picker.grep({ live = false }) end'';
      options = {
        desc = "Grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action.__raw = ''function() Snacks.picker.grep_word() end'';
      options = {
        desc = "Grep current word";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = ''function() Snacks.picker.help() end'';
      options = {
        desc = "Help tags";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''function() Snacks.picker.registers() end'';
      options = {
        desc = "Registers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action.__raw = ''function() Snacks.picker.keymaps() end'';
      options = {
        desc = "Keymaps";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = ''function() Snacks.picker.marks() end'';
      options = {
        desc = "Marks";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fM";
      action.__raw = ''function() Snacks.picker.man() end'';
      options = {
        desc = "Man pages";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = ''function() Snacks.picker.lsp_references() end'';
      options = {
        desc = "References";
        silent = true;
        nowait = true;
      };
    }
    {
      mode = "n";
      key = "gI";
      action.__raw = ''function() Snacks.picker.lsp_implementations() end'';
      options = {
        desc = "Goto Implementation";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gai";
      action.__raw = ''function() Snacks.picker.lsp_incoming_calls() end'';
      options = {
        desc = "Incoming Calls";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gao";
      action.__raw = ''function() Snacks.picker.lsp_outgoing_calls() end'';
      options = {
        desc = "Outgoing Calls";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ss";
      action.__raw = ''function() Snacks.picker.lsp_symbols() end'';
      options = {
        desc = "LSP Symbols";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>sS";
      action.__raw = ''function() Snacks.picker.lsp_workspace_symbols() end'';
      options = {
        desc = "LSP Workspace Symbols";
        silent = true;
      };
    }
  ];
}
