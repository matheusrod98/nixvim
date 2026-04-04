{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action = ":find ";
      options.desc = "Smart";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = ":buffers<cr>:buffer ";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = ":grep! ";
      options.desc = "Grep";
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "q:";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ":find ";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd>ProjectGrep<cr>";
      options.desc = "Visual selection or word";
    }
    {
      mode = "x";
      key = "<leader>fw";
      action = ":<C-u>'<,'>ProjectGrep<cr>";
      options.desc = "Visual selection or word";
    }
    {
      mode = "n";
      key = "<leader>\"";
      action = "<cmd>registers<cr>";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>f/";
      action = "q/";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>fC";
      action = "<cmd>command<cr>";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":help ";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>fj";
      action = "<cmd>jumps<cr>";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd>map<cr>";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>marks<cr>";
      options.desc = "Marks";
    }
    {
      mode = "n";
      key = "<leader>fM";
      action = ":Man ";
      options.desc = "Man Pages";
    }
    {
      mode = "n";
      key = "<leader>gx";
      action = "<cmd>OpenGitRepo<cr>";
      options = {
        desc = "Open Git repository in browser";
        silent = true;
      };
    }
  ];
}
