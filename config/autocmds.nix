{
  autoGroups = {
    "kickstart-highlight-yank" = {
      clear = true;
    };
    "cursor-restore" = {
      clear = true;
    };
    "cfilter-setup" = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "VimEnter";
      desc = "Set cursor to block in normal mode when entering Neovim";
      group = "cursor-restore";
      command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50";
    }
    {
      event = "ExitPre";
      desc = "Set cursor back to beam when leaving Neovim";
      group = "cursor-restore";
      command = "set guicursor=a:ver90";
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback.__raw = "function() vim.hl.on_yank() end";
    }
    {
      event = "QuickFixCmdPost";
      group = "cfilter-setup";
      pattern = "*";
      callback.__raw = "function() vim.cmd('packadd cfilter') end";
      once = true;
    }
    {
      event = "FileType";
      group = "cfilter-setup";
      pattern = "qf";
      callback.__raw = "function() vim.cmd('packadd cfilter') end";
      once = true;
    }
  ];
}
