{
  keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = "function() Snacks.picker.smart() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>b";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Grep";
    }
    {
      mode = "n";
      key = "<leader>:";
      action.__raw = "function() Snacks.picker.command_history() end";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find Files";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>fw";
      action.__raw = "function() Snacks.picker.grep_word() end";
      options.desc = "Visual selection or word";
    }
    {
      mode = "n";
      key = "<leader>\"";
      action.__raw = "function() Snacks.picker.registers() end";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>f/";
      action.__raw = "function() Snacks.picker.search_history() end";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action.__raw = "function() Snacks.picker.command_history() end";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>fC";
      action.__raw = "function() Snacks.picker.commands() end";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = "function() Snacks.picker.help() end";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>fj";
      action.__raw = "function() Snacks.picker.jumps() end";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = "function() Snacks.picker.marks() end";
      options.desc = "Marks";
    }
    { mode = "n"; key = "<leader>fM"; action.__raw = "function() Snacks.picker.man() end"; options.desc = "Man Pages"; }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = "function() Snacks.gitbrowse() end";
      options = {
        desc = "Open Git repository in browser"; 
        silent = true;
      };
    }
  ];
}
