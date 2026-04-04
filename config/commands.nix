{
  programs.nixvim = {
    extraConfigLua = ''
      _G.nixvim_config_helpers = _G.nixvim_config_helpers or {}

      local helpers = _G.nixvim_config_helpers

      local mode_names = {
        n = "NORMAL",
        no = "O-PENDING",
        nov = "O-PENDING",
        noV = "O-PENDING",
        ["no\22"] = "O-PENDING",
        niI = "NORMAL",
        niR = "NORMAL",
        niV = "NORMAL",
        nt = "NORMAL",
        v = "VISUAL",
        vs = "VISUAL",
        V = "V-LINE",
        Vs = "V-LINE",
        ["\22"] = "V-BLOCK",
        ["\22s"] = "V-BLOCK",
        s = "SELECT",
        S = "S-LINE",
        ["\19"] = "S-BLOCK",
        i = "INSERT",
        ic = "INSERT",
        ix = "INSERT",
        R = "REPLACE",
        Rc = "REPLACE",
        Rx = "REPLACE",
        Rv = "V-REPLACE",
        c = "COMMAND",
        cv = "EX",
        ce = "EX",
        r = "PROMPT",
        rm = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        t = "TERMINAL",
      }

      local function trim(text)
        return vim.trim(text or "")
      end

      function helpers.project_root()
        return vim.fs.root(0, ".git") or vim.uv.cwd()
      end

      local function visual_selection()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")
        local lines = vim.api.nvim_buf_get_text(
          0,
          start_pos[2] - 1,
          start_pos[3] - 1,
          end_pos[2] - 1,
          end_pos[3],
          {}
        )
        return trim(table.concat(lines, " "))
      end

      local function grep(query, literal)
        query = trim(query)
        if query == "" then
          return
        end

        local root = helpers.project_root()
        local flags = literal and "-F -- " or "-- "

        vim.cmd(("silent grep! %s%s %s"):format(
          flags,
          vim.fn.shellescape(query),
          vim.fn.shellescape(root)
        ))
        vim.cmd.cwindow()
      end

      function helpers.find(cmdarg, cmdcomplete)
        local root = helpers.project_root()
        local needle = trim(cmdarg):lower()
        local has_path = needle:find("/") ~= nil
        local matches = vim.fs.find(function(name, path)
          if path:find("/%.git/") or path:find("/node_modules/") then
            return false
          end

          if needle == "" then
            return cmdcomplete
          end

          local rel = vim.fs.relpath(root, path) or path
          local target = has_path and rel or name
          return target:lower():find(needle, 1, true) ~= nil
        end, {
          limit = cmdcomplete and math.huge or 50,
          path = root,
          type = "file",
        })

        if cmdcomplete then
          local items = {}
          for _, path in ipairs(matches) do
            table.insert(items, vim.fs.relpath(root, path) or path)
          end
          table.sort(items)
          return items
        end

        return matches
      end

      function helpers.mode_status()
        local mode = vim.api.nvim_get_mode().mode
        return (" %s "):format(mode_names[mode] or mode)
      end

      function helpers.diff_status()
        local summary = vim.b.minidiff_summary_string
        if type(summary) == "string" and summary ~= "" then
          return summary .. " "
        end
        return ""
      end

      function helpers.sidekick_status()
        local ok, sidekick = pcall(require, "sidekick.status")
        if not ok then
          return ""
        end

        local status = sidekick.get()
        if not status then
          return ""
        end

        local hl = status.kind == "Error" and "DiagnosticError"
          or status.busy and "DiagnosticWarn"
          or "Special"

        return ("%%#%s# %%*"):format(hl)
      end

      function helpers.progress_status()
        local lsp = trim(vim.lsp.status())
        if lsp ~= "" then
          return lsp .. " "
        end

        local progress = trim(vim.ui.progress_status())
        if progress ~= "" then
          return progress .. " "
        end

        return ""
      end

      function helpers.diagnostic_status()
        local status = trim(vim.diagnostic.status())
        if status ~= "" then
          return status .. " "
        end
        return ""
      end

      local function normalize_remote(url)
        url = trim(url):gsub("%.git$", "")
        if url == "" then
          return nil
        end

        local host, path = url:match("^git@([^:]+):(.+)$")
        if host and path then
          return ("https://%s/%s"):format(host, path)
        end

        return url:gsub("^ssh://git@([^/]+)/", "https://%1/")
      end

      function helpers.open_git_repo()
        local result = vim.system({ "git", "remote", "get-url", "origin" }, {
          cwd = helpers.project_root(),
          text = true,
        }):wait()

        if result.code ~= 0 then
          vim.notify("No git remote named origin", vim.log.levels.WARN)
          return
        end

        local url = normalize_remote(result.stdout)
        if not url then
          vim.notify("Unable to parse git remote URL", vim.log.levels.WARN)
          return
        end

        vim.ui.open(url)
      end

      function helpers.toggle_quickfix()
        if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
          vim.cmd.cclose()
          return
        end
        vim.cmd.copen()
      end

      function helpers.project_grep(opts)
        local query = trim(opts.args)
        if query == "" then
          query = opts.range > 0 and visual_selection() or vim.fn.expand("<cword>")
        end
        grep(query, true)
      end
    '';

    userCommands = {
      OpenGitRepo = {
        command.__raw = "function() nixvim_config_helpers.open_git_repo() end";
        desc = "Open Git repository in browser";
      };
      ProjectGrep = {
        command.__raw = "function(opts) nixvim_config_helpers.project_grep(opts) end";
        desc = "Grep visual selection or current word";
        nargs = "*";
        range = true;
      };
      ToggleQuickfix = {
        command.__raw = "function() nixvim_config_helpers.toggle_quickfix() end";
        desc = "Toggle quickfix list";
      };
    };
  };
}
