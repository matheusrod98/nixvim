{
  programs.nixvim.autoGroups.lsp_keybinds = {
    clear = true;
  };

  programs.nixvim.autoCmd = [
    {
      event = "LspAttach";
      group = "lsp_keybinds";
      callback.__raw = ''
        function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, 
            { buffer = bufnr, desc = "Hover Documentation", silent = true })
          
          vim.keymap.set("n", "<leader>=", function() vim.lsp.buf.format({ async = true }) end, 
            { buffer = bufnr, desc = "Format buffer", silent = true })
          
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, 
            { buffer = bufnr, desc = "Rename", silent = true })
          
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, 
            { buffer = bufnr, desc = "Code Actions", silent = true })
          
          vim.keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, 
            { buffer = bufnr, desc = "Go to Type Definition", silent = true })
          
          vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, 
            { buffer = bufnr, desc = "Go to Definition" })
          
          vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, 
            { buffer = bufnr, desc = "Go to Declaration" })
          
          vim.keymap.set("n", "<leader>rf", function() Snacks.picker.lsp_references() end, 
            { buffer = bufnr, desc = "References", nowait = true })
          
          vim.keymap.set("n", "<leader>ip", function() Snacks.picker.lsp_implementations() end, 
            { buffer = bufnr, desc = "Goto Implementation" })
          
          vim.keymap.set("n", "<leader>ic", function() Snacks.picker.lsp_incoming_calls() end, 
            { buffer = bufnr, desc = "Incoming Calls", silent = true })
          
          vim.keymap.set("n", "<leader>oc", function() Snacks.picker.lsp_outgoing_calls() end, 
            { buffer = bufnr, desc = "Outgoing Calls", silent = true })
          
          vim.keymap.set("n", "<leader>dw", function() Snacks.picker.diagnostics() end, 
            { buffer = bufnr, desc = "Diagnostics" })
          
          vim.keymap.set("n", "<leader>db", function() Snacks.picker.diagnostics_buffer() end, 
            { buffer = bufnr, desc = "Buffer Diagnostics" })
          
          vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.open_float() end, 
            { buffer = bufnr, desc = "Line Diagnostics", silent = true })
          
          vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, 
            { buffer = bufnr, desc = "Next Error", silent = true })
          
          vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, 
            { buffer = bufnr, desc = "Previous Error", silent = true })
          
          vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, 
            { buffer = bufnr, desc = "Next Warning", silent = true })
          
          vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, 
            { buffer = bufnr, desc = "Previous Warning", silent = true })
          
          vim.keymap.set("n", "]h", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT }) end, 
            { buffer = bufnr, desc = "Next Hint", silent = true })
          
          vim.keymap.set("n", "[h", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT }) end, 
            { buffer = bufnr, desc = "Previous Hint", silent = true })
          
          vim.keymap.set("n", "]i", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO }) end, 
            { buffer = bufnr, desc = "Next Info", silent = true })
          
          vim.keymap.set("n", "[i", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO }) end, 
            { buffer = bufnr, desc = "Previous Info", silent = true })
          
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, 
            { buffer = bufnr, desc = "Previous Diagnostic", silent = true })
          
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, 
            { buffer = bufnr, desc = "Next Diagnostic", silent = true })
        end
      '';
    }
  ];
}
