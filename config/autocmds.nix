{
  programs.nixvim.autoCmd = [
    {
      event = "LspProgress";
      desc = "Redraw statusline on LSP progress";
      command = "redrawstatus";
    }
    {
      event = "VimResized";
      command = "wincmd =";
      desc = "Equalize window sizes after resizing Vim";
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight-yank";
      callback.__raw = "function() vim.highlight.on_yank({ timeout = 200, visual = true }) end";
    }
    {
      event = "QuickFixCmdPost";
      pattern = "*";
      callback.__raw = "function() vim.cmd('packadd cfilter') end";
      once = true;
    }
    {
      event = "FileType";
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
