{
  keymaps = [
    {
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      mode = "n";
      options = {
        desc = "Hover Documentation";
        silent = true;
      };
    }
    {
      key = "<leader>=";
      action = "<cmd>lua vim.lsp.buf.format({ async = true })<cr>";
      mode = "n";
      options = {
        desc = "Format buffer";
        silent = true;
      };
    }
    {
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      mode = "n";
      options = {
        desc = "Rename";
        silent = true;
      };
    }
    {
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      mode = "n";
      options = {
        desc = "Code Actions";
        silent = true;
      };
    }
    {
      key = "gt";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      mode = "n";
      options = {
        desc = "Go to Type Definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options.desc = "Go to Definition";
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "function() Snacks.picker.lsp_declarations() end";
      options.desc = "Go to Declaration";
    }
    {
      mode = "n";
      key = "<leader>rf";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options = {
        desc = "References";
        nowait = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ip";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options.desc = "Goto Implementation";
    }
    {
      key = "<leader>ic";
      action.__raw = "function() vim.lsp.buf.incoming_calls() end";
      mode = "n";
      options = {
        desc = "Incoming Calls";
        silent = true;
      };
    }
    {
      key = "<leader>oc";
      action.__raw = "function() vim.lsp.buf.outgoing_calls() end";
      mode = "n";
      options = {
        desc = "Outgoing Calls";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action.__raw = "function() Snacks.picker.diagnostics() end";
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = "function() Snacks.picker.diagnostics_buffer() end";
      options.desc = "Buffer Diagnostics";
    }
    {
      key = "<leader>dl";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      mode = "n";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }
    {
      key = "]e";
      action = "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>";
      mode = "n";
      options = {
        desc = "Next Error";
        silent = true;
      };
    }
    {
      key = "[e";
      action = "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>";
      mode = "n";
      options = {
        desc = "Previous Error";
        silent = true;
      };
    }
    {
      key = "]w";
      action = "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })<cr>";
      mode = "n";
      options = {
        desc = "Next Warning";
        silent = true;
      };
    }
    {
      key = "[w";
      action = "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })<cr>";
      mode = "n";
      options = {
        desc = "Previous Warning";
        silent = true;
      };
    }
    {
      key = "]h";
      action = "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })<cr>";
      mode = "n";
      options = {
        desc = "Next Hint";
        silent = true;
      };
    }
    {
      key = "[h";
      action = "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })<cr>";
      mode = "n";
      options = {
        desc = "Previous Hint";
        silent = true;
      };
    }
    {
      key = "]i";
      action = "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO })<cr>";
      mode = "n";
      options = {
        desc = "Next Info";
        silent = true;
      };
    }
    {
      key = "[i";
      action = "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO })<cr>";
      mode = "n";
      options = {
        desc = "Previous Info";
        silent = true;
      };
    }
    {
      key = "[d";
      action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      mode = "n";
      options = {
        desc = "Previous Diagnostic";
        silent = true;
      };
    }
    {
      key = "]d";
      action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      mode = "n";
      options = {
        desc = "Next Diagnostic";
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
      action = "<cmd>lua local relative_path = vim.fn.expand('%') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end vim.fn.setreg('+', relative_path) vim.notify(\"Copied to clipboard: \" .. relative_path, vim.log.levels.INFO)<cr>";
      mode = "n";
      options = {
        desc = "Copy relative file path to clipboard";
        silent = true;
      };
    }
    {
      key = "<leader>cl";
      action = "<cmd>lua local relative_path = vim.fn.expand('%') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end local line_number = vim.fn.line(\".\") local file_with_line = relative_path .. \":\" .. line_number vim.fn.setreg('+', file_with_line) vim.notify(\"Copied to clipboard: \" .. file_with_line, vim.log.levels.INFO)<cr>";
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
}
