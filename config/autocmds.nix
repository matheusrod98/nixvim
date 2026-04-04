{
  programs.nixvim.autoGroups = {
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
    "cursor-shape" = {
      clear = true;
    };
  };

  programs.nixvim.autoCmd = [
    {
      event = "LspProgress";
      desc = "Redraw statusline on LSP progress";
      group = "lsp";
      command = "redrawstatus";
    }
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
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight-yank";
      callback.__raw = "function() vim.highlight.on_yank({ timeout = 200, visual = true }) end";
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
        if not client then
          return
        end
        if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, args.buf)
        end
        if client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win].foldmethod = 'expr'
          vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
      end
      ";
    }
    {
      event = "VimLeavePre";
      desc = "Restore terminal default cursor on exit";
      group = "cursor-shape";
      callback.__raw = ''
        function()
          vim.opt.guicursor = ""
          vim.cmd('set guicursor=a:ver25-blinkon1')
        end
      '';
    }
  ];
}
