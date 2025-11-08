{
  autoGroups = {
    "highlight-yank" = {
      clear = true;
    };
    "cfilter" = {
      clear = true;
    };
    "lsp" = {
      clear = true;
    };
    "help-window" = {
      clear = true;
    };
    "window-management" = {
      clear = true;
    };
    "cursorline" = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
      desc = "Open help in a vertical split on the right";
      group = "help-window";
    }
    {
      event = "VimResized";
      command = "wincmd =";
      desc = "Equalize window sizes after resizing Vim";
      group = "window-management";
    }
    {
      event = ["WinEnter" "BufEnter"];
      desc = "Activate cursorline only in the active window";
      group = "cursorline";
      callback.__raw = "callback = function() vim.wo.cursorline = true end";
    }
    {
      event = ["WinLeave" "BufLeave"];
      desc = "Deactivate cursorline in inactive windows";
      group = "cursorline";
      callback.__raw = "callback = function() vim.wo.cursorline = false end";
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight-yank";
      callback.__raw = "callback = function() vim.highlight.on_yank({ timeout = 200, visual = true }) end})";
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
