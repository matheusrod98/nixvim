{
  programs.nixvim.autoCmd = [
    {
      event = "VimResized";
      command = "wincmd =";
      desc = "Equalize window sizes after resizing Vim";
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      callback.__raw = "function() vim.hl.on_yank({ timeout = 200 }) end";
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
    {
      event = "LspProgress";
      desc = "Show LSP progress via native progress messages";
      callback.__raw = ''
        function(ev)
          local value = ev.data.params.value
          local token = ev.data.params.token or ""
          local id = "lsp." .. ev.data.client_id .. "." .. token
          local status = value.kind ~= "end" and "running" or "success"
          vim.api.nvim_echo({ { value.message or value.title or "done" } }, false, {
            id = id,
            kind = "progress",
            source = "vim.lsp",
            title = value.title,
            status = status,
            percent = value.percentage,
          })
        end
      '';
    }
  ];
}
