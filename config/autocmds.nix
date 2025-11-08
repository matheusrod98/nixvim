{
  autoGroups = {
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
  };

  autoCmd = [
    {
      event = "LspProgress";
      desc = "Show LSP progress in the notification area";
      group = "lsp";
      callback.__raw = ''
        function(ev)
          ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
          ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
          local progress = vim.defaulttable()
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
          if not client or type(value) ~= "table" then
            return
          end
          local p = progress[client.id]

          for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
              p[i] = {
                token = ev.data.params.token,
                msg = ("[%3d%%] %s%s"):format(
                  value.kind == "end" and 100 or value.percentage or 100,
                  value.title or "",
                  value.message and (" **%s**"):format(value.message) or ""
                ),
                done = value.kind == "end",
              }
              break
            end
          end

          local msg = {} ---@type string[]
          progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
          end, p)

          local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
          vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
              notif.icon = #progress[client.id] == 0 and " "
              or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
          })
        end'';
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
      event = ["WinEnter" "BufEnter"];
      desc = "Activate cursorline only in the active window";
      group = "cursorline";
      callback.__raw = "function() vim.wo.cursorline = true end";
    }
    {
      event = ["WinLeave" "BufLeave"];
      desc = "Deactivate cursorline in inactive windows";
      group = "cursorline";
      callback.__raw = "function() vim.wo.cursorline = false end";
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
        if client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldmethod = 'expr'
          vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
      end
      ";
    }
  ];
}
