{
  keymaps = [
    {
      key = "<leader>=";
      action = "gg=G``";
      mode = "n";
      options = {
        desc = "Format buffer (fallback)";
        silent = true;
      };
    }
    {
      key = "<leader>Q";
      action = ":lua (function() local windows = vim.fn.getwininfo() for _, win in pairs(windows) do if win['quickfix'] == 1 then vim.cmd.cclose() return end end vim.cmd.copen() end)()<cr>";
      mode = "n";
      options = {
        desc = "Toggle quickfix list";
        silent = true;
      };
    }
    {
      key = "]q";
      action = "<cmd>cnext<cr>";
      mode = "n";
      options = {
        desc = "Next quickfix item";
        silent = true;
      };
    }
    {
      key = "[q";
      action = "<cmd>cprev<cr>";
      mode = "n";
      options = {
        desc = "Previous quickfix item";
        silent = true;
      };
    }
    {
      key = "<leader>L";
      action = ":lua (function() local windows = vim.fn.getwininfo() for _, win in pairs(windows) do if win['loclist'] == 1 then vim.cmd.lclose() return end end vim.cmd.lopen() end)()<cr>";
      mode = "n";
      options = {
        desc = "Toggle location list";
        silent = true;
      };
    }
    {
      key = "]l";
      action = "<cmd>lnext<cr>";
      mode = "n";
      options = {
        desc = "Next location list item";
        silent = true;
      };
    }
    {
      key = "[l";
      action = "<cmd>lprev<cr>";
      mode = "n";
      options = {
        desc = "Previous location list item";
        silent = true;
      };
    }
    {
      key = "<leader>cp";
      action = "<cmd>lua local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end vim.fn.setreg('+', relative_path) vim.notify(\"Copied to clipboard: \" .. relative_path, vim.log.levels.INFO)<cr>";
      mode = "n";
      options = {
        desc = "Copy relative file path to clipboard";
        silent = true;
      };
    }
    {
      key = "<leader>cl";
      action = "<cmd>lua local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end local line_number = vim.fn.line(\".\") local file_with_line = relative_path .. \":\" .. line_number vim.fn.setreg('+', file_with_line) vim.notify(\"Copied to clipboard: \" .. file_with_line, vim.log.levels.INFO)<cr>";
      mode = "n";
      options = {
        desc = "Copy relative file path with line number to clipboard";
        silent = true;
      };
    }
    {
      key = "-";
      action = "<cmd>Oil<cr>";
      mode = "n";
      options = {
        desc = "Open Oil";
        silent = true;
      };
    }
    {
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      mode = "n";
      options = {
        desc = "Clear search highlight";
        silent = true;
      };
    }
    {
      key = "[t";
      action = "<cmd>tabprevious<cr>";
      mode = "n";
      options = {
        desc = "Previous tab";
        silent = true;
      };
    }
    {
      key = "]t";
      action = "<cmd>tabnext<cr>";
      mode = "n";
      options = {
        desc = "Next tab";
        silent = true;
      };
    }
    {
      key = "[b";
      action = "<cmd>bprevious<cr>";
      mode = "n";
      options = {
        desc = "Previous buffer";
        silent = true;
      };
    }
    {
      key = "]b";
      action = "<cmd>bnext<cr>";
      mode = "n";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
    {
      key = "n";
      action = "nzzzv";
      mode = "n";
      options = {
        desc = "Next search result (centered)";
        silent = true;
      };
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = "n";
      options = {
        desc = "Previous search result (centered)";
        silent = true;
      };
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = "n";
      options = {
        desc = "Half page down (centered)";
        silent = true;
      };
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = "n";
      options = {
        desc = "Half page up (centered)";
        silent = true;
      };
    }
    {
      key = "<C-b>";
      action = "<C-b>zz";
      mode = "n";
      options = {
        desc = "Full page up (centered)";
        silent = true;
      };
    }
    {
      key = "<C-f>";
      action = "<C-f>zz";
      mode = "n";
      options = {
        desc = "Full page down (centered)";
        silent = true;
      };
    }
    {
      key = "<C-S-h>";
      action = "<C-w>H";
      mode = "n";
      options = {
        desc = "Move window to the left";
        silent = true;
      };
    }
    {
      key = "<C-S-l>";
      action = "<C-w>L";
      mode = "n";
      options = {
        desc = "Move window to the right";
        silent = true;
      };
    }
    {
      key = "<C-S-j>";
      action = "<C-w>J";
      mode = "n";
      options = {
        desc = "Move window to the lower";
        silent = true;
      };
    }
    {
      key = "<C-S-k>";
      action = "<C-w>K";
      mode = "n";
      options = {
        desc = "Move window to the upper";
        silent = true;
      };
    }
    {
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      mode = "n";
      options = {
        desc = "Increase window height";
        silent = true;
      };
    }
    {
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      mode = "n";
      options = {
        desc = "Decrease window height";
        silent = true;
      };
    }
    {
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      mode = "n";
      options = {
        desc = "Decrease window width";
        silent = true;
      };
    }
    {
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      mode = "n";
      options = {
        desc = "Increase window width";
        silent = true;
      };
    }
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
      options = {
        desc = "Move to left window";
        silent = true;
      };
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
      options = {
        desc = "Move to bottom window";
        silent = true;
      };
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
      options = {
        desc = "Move to top window";
        silent = true;
      };
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
      options = {
        desc = "Move to right window";
        silent = true;
      };
    }
    {
      key = "<leader>v";
      action = "<cmd>vsplit<cr>";
      mode = "n";
      options = {
        desc = "Split window vertically";
        silent = true;
      };
    }
    {
      key = "<leader>s";
      action = "<cmd>split<cr>";
      mode = "n";
      options = {
        desc = "Split window horizontally";
        silent = true;
      };
    }
    {
      key = "<leader>w";
      action = "<cmd>update<cr>";
      mode = [ "n" ];
      options = {
        desc = "Save current buffer";
        silent = true;
      };
    }
    {
      key = "<leader>W";
      action = "<cmd>bufdo update<cr>";
      mode = [ "n" ];
      options = {
        desc = "Save all buffers";
        silent = true;
      };
    }
    {
      key = "<leader>q";
      action = "<cmd>quit<cr>";
      mode = "n";
      options = {
        desc = "Quit window";
        silent = true;
      };
    }
    {
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>";
      mode = "n";
      options = {
        desc = "Toggle Undotree";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = "function() Snacks.picker.smart() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>b";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Grep";
    }
    {
      mode = "n";
      key = "<leader>:";
      action.__raw = "function() Snacks.picker.command_history() end";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find Files";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>fw";
      action.__raw = "function() Snacks.picker.grep_word() end";
      options.desc = "Visual selection or word";
    }
    {
      mode = "n";
      key = "<leader>\"";
      action.__raw = "function() Snacks.picker.registers() end";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>f/";
      action.__raw = "function() Snacks.picker.search_history() end";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action.__raw = "function() Snacks.picker.command_history() end";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>fC";
      action.__raw = "function() Snacks.picker.commands() end";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = "function() Snacks.picker.help() end";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>fj";
      action.__raw = "function() Snacks.picker.jumps() end";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = "function() Snacks.picker.marks() end";
      options.desc = "Marks";
    }
    {
      mode = "n";
      key = "<leader>fM";
      action.__raw = "function() Snacks.picker.man() end";
      options.desc = "Man Pages";
    }
    {
      mode = "n";
      key = "gm";
      action = "<cmd>TSJToggle<cr>";
      options = {
        desc = "Toggle join/split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gs";
      action = "<cmd>TSJSplit<cr>";
      options = {
        desc = "Split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gj";
      action = "<cmd>TSJJoin<cr>";
      options = {
        desc = "Join";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>tab Git<cr>";
      options = {
        desc = "Open Fugitive in new tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gcc";
      action = "<cmd>Git commit -v<cr>";
      options = {
        desc = "Git commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gca";
      action = "<cmd>Git commit --amend<cr>";
      options = {
        desc = "Amend last commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gcA";
      action = "<cmd>Git commit --amend --no-edit<cr>";
      options = {
        desc = "Amend last commit";
        silent = true;
      };
    }
  ];

  autoGroups.lsp_keybinds = {
    clear = true;
  };

  autoCmd = [
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
