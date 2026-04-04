{
  programs.nixvim.autoCmd = [
    {
      event = [
        "LspProgress"
        "Progress"
        "DiagnosticChanged"
      ];
      desc = "Redraw statusline on LSP progress";
      command = "redrawstatus";
    }
    {
      event = "User";
      pattern = "MiniDiffUpdated";
      desc = "Redraw statusline on mini diff updates";
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
      callback.__raw = "function() vim.highlight.on_yank({ timeout = 200, visual = true }) end";
    }
    {
      event = "VimLeavePre";
      desc = "Restore terminal default cursor on exit";
      callback.__raw = ''
        function()
          vim.opt.guicursor = ""
          vim.cmd('set guicursor=a:ver25-blinkon1')
        end
      '';
    }
  ];
}
