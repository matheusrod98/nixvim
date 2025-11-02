{
  autoGroups = {
    "kickstart-highlight-yank" = {
      clear = true;
    };
    "cursor-restore" = {
      clear = true;
    };
    "cfilter" = {
      clear = true;
    };
    "lsp" = {
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
      group = "cfilter";
      pattern = "*";
      callback.__raw = "function() vim.cmd('packadd cfilter') end";
      once = true;
    }
    {
      event = "FileType";
      group = "cfilter";
      pattern = "qf";
      callback.__raw = "function() vim.cmd('packadd cfilter') end";
      once = true;
    }
    {
      event = "LspAttach";
      desc = "Enable LSP-based folding";
      group = "lsp";
      callback.__raw = "function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldmethod = 'expr'
          vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
      end
      ";
    }
  ];
}
