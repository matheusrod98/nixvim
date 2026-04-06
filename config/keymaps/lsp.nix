{
  programs.nixvim.plugins.lsp.keymaps = {
    silent = true;
    lspBuf = {
      "K" = {
        action = "hover";
        desc = "Hover Documentation";
      };
      "<leader>rn" = {
        action = "rename";
        desc = "Rename";
      };
      "<leader>ca" = {
        action = "code_action";
        desc = "Code Actions";
      };
    };
    extra = [
      {
        key = "gd";
        action.__raw = "function() Snacks.picker.lsp_definitions() end";
        options.desc = "Goto Definition";
      }
      {
        key = "gD";
        action.__raw = "function() Snacks.picker.lsp_declarations() end";
        options.desc = "Goto Declaration";
      }
      {
        key = "<leader>fr";
        action.__raw = "function() Snacks.picker.lsp_references() end";
        options.desc = "Find References";
        options.nowait = true;
      }
      {
        key = "<leader>ip";
        action.__raw = "function() Snacks.picker.lsp_implementations() end";
        options.desc = "Goto Implementation";
      }
      {
        key = "<leader>gt";
        action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
        options.desc = "Goto T[t]ype Definition";
      }
      {
        key = "<leader>ic";
        action.__raw = "function() Snacks.picker.lsp_incoming_calls() end";
        options.desc = "[I]ncoming Calls";
      }
      {
        key = "<leader>oc";
        action.__raw = "function() Snacks.picker.lsp_outgoing_calls() end";
        options.desc = "[O]utgoing Calls";
      }
      {
        key = "<leader>ss";
        action.__raw = "function() Snacks.picker.lsp_symbols() end";
        options.desc = "LSP Symbols";
      }
      {
        key = "<leader>sS";
        action.__raw = "function() Snacks.picker.lsp_workspace_symbols() end";
        options.desc = "LSP Workspace Symbols";
      }
      {
        key = "<leader>=";
        action.__raw = "function() vim.lsp.buf.format({ async = true }) end";
        options.desc = "Format buffer";
      }
      {
        key = "<leader>wd";
        action.__raw = "function() vim.diagnostic.setqflist({ open = true }) end";
        options.desc = "Diagnostics";
      }
      {
        key = "<leader>bd";
        action.__raw = "function() vim.diagnostic.setloclist({ open = true }) end";
        options.desc = "Buffer Diagnostics";
      }
      {
        key = "<leader>ld";
        action.__raw = "vim.diagnostic.open_float";
        options.desc = "Line Diagnostics";
      }
      {
        key = "]e";
        action.__raw = "function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end";
        options.desc = "Next Error";
      }
      {
        key = "[e";
        action.__raw = "function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end";
        options.desc = "Previous Error";
      }
      {
        key = "]w";
        action.__raw = "function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end";
        options.desc = "Next Warning";
      }
      {
        key = "[w";
        action.__raw = "function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end";
        options.desc = "Previous Warning";
      }
      {
        key = "]h";
        action.__raw = "function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT }) end";
        options.desc = "Next Hint";
      }
      {
        key = "[h";
        action.__raw = "function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.HINT }) end";
        options.desc = "Previous Hint";
      }
      {
        key = "]i";
        action.__raw = "function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO }) end";
        options.desc = "Next Info";
      }
      {
        key = "[i";
        action.__raw = "function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.INFO }) end";
        options.desc = "Previous Info";
      }
      {
        key = "<leader>cl";
        action.__raw = "vim.lsp.codelens.run";
        options.desc = "Run code lens";
      }
      {
        key = "<leader>cL";
        action.__raw = "vim.lsp.codelens.refresh";
        options.desc = "Refresh code lenses";
      }
    ];
  };
}
