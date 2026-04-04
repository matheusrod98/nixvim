{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          "K" = {
            action = "hover";
            desc = "Hover Documentation";
          };
          "gd" = {
            action = "definition";
            desc = "Go to Definition";
          };
          "gD" = {
            action = "declaration";
            desc = "Go to Declaration";
          };
          "gt" = {
            action = "type_definition";
            desc = "Go to Type Definition";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Actions";
          };
          "<leader>fr" = {
            action = "references";
            desc = "References";
            nowait = true;
          };
          "<leader>ip" = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          "<leader>ic" = {
            action = "incoming_calls";
            desc = "Incoming Calls";
          };
          "<leader>oc" = {
            action = "outgoing_calls";
            desc = "Outgoing Calls";
          };
        };
        extra = [
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
            key = "[d";
            action.__raw = "function() vim.diagnostic.jump({ count = -1 }) end";
            options.desc = "Previous Diagnostic";
          }
          {
            key = "]d";
            action.__raw = "function() vim.diagnostic.jump({ count = 1 }) end";
            options.desc = "Next Diagnostic";
          }
        ];
      };
    };
    schemastore.enable = true;
  };
}
