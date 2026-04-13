{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      vscode-js-debug
    ];

    extraConfigLuaPre = ''
      function _G.nixvim_dap_lualine()
        local ok, dap = pcall(require, "dap")
        if not ok or dap.session() == nil then
          return ""
        end

        local status = dap.status()
        if status ~= "" then
          return " " .. status
        end

        return ""
      end
    '';

    plugins = {
      dap = {
        enable = true;
        adapters.servers = let
          js-debug = {
            host = "127.0.0.1";
            port = "$\{port}";
            executable = {
              command = pkgs.lib.getExe pkgs.vscode-js-debug;
              args = ["$\{port}"];
            };
          };
        in {
          chrome = js-debug;
          extensionHost = js-debug;
          msedge = js-debug;
          node = js-debug;
          node-terminal = js-debug;
          pwa-chrome = js-debug;
          pwa-extensionHost = js-debug;
          pwa-msedge = js-debug;
          pwa-node = js-debug;
        };
      };

      dap-go = {
        enable = true;
        settings = {
          delve = {
            initialize_timeout_sec = 20;
            path = "dlv";
            port = "$\{port}";
          };
        };
      };

      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };

    extraConfigLua = ''
      local dap = require("dap")
      local dapui = require("dapui")

      local function refresh_lualine()
        local ok, lualine = pcall(require, "lualine")
        if ok then
          lualine.refresh({ place = { "statusline" } })
        end
      end

      local js_debug_types = {
        chrome = "pwa-chrome",
        extensionHost = "pwa-extensionHost",
        msedge = "pwa-msedge",
        node = "pwa-node",
      }

      dap.listeners.on_config["nixvim_js_debug_types"] = function(config)
        local normalized = vim.deepcopy(config)
        normalized.type = js_debug_types[normalized.type] or normalized.type
        return normalized
      end

      dap.listeners.after.event_initialized["nixvim_dapui"] = function()
        dapui.open()
        refresh_lualine()
      end

      dap.listeners.before.event_terminated["nixvim_dapui"] = function()
        dapui.close()
        refresh_lualine()
      end

      dap.listeners.before.event_exited["nixvim_dapui"] = function()
        dapui.close()
        refresh_lualine()
      end

      dap.listeners.before.disconnect["nixvim_dapui"] = function()
        dapui.close()
        refresh_lualine()
      end

      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("nixvim_dap_lualine", { clear = true }),
        pattern = "DapProgressUpdate",
        callback = refresh_lualine,
      })
    '';
  };
}
