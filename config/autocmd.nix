{
  programs.nixvim.autoCmd = [
    {
      event = "LspAttach";
      desc = "Enable inline completion for Copilot";
      callback.__raw = ''
        function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
            vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
            vim.keymap.set(
              'i',
              '<C-F>',
              vim.lsp.inline_completion.get,
              { desc = 'LSP: accept inline completion', buffer = bufnr }
            )
            vim.keymap.set(
              'i',
              '<C-G>',
              vim.lsp.inline_completion.select,
              { desc = 'LSP: switch inline completion', buffer = bufnr }
            )
          end
        end
      '';
    }
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
          vim.cmd('set guicursor=a:ver25-blinkon1')
        end
      '';
    }
    {
      event = "FileType";
      pattern = ["markdown" "text" "gitcommit" "rst"];
      desc = "Enable prose-friendly editing for text filetypes";
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us,pt_br"
        end
      '';
    }
  ];
}
