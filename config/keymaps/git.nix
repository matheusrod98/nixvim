{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''function() Snacks.lazygit.open() end'';
      options = {
        desc = "Open LazyGit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gB";
      action.__raw = ''function() Snacks.gitbrowse({ what = "repo" }) end'';
      options = {
        desc = "Browse git repo";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gF";
      action.__raw = ''function() Snacks.gitbrowse({ what = "file" }) end'';
      options = {
        desc = "Browse git file";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gY";
      action.__raw = ''function() Snacks.gitbrowse({ what = "permalink" }) end'';
      options = {
        desc = "Browse git permalink";
        silent = true;
      };
    }
  ];
}
