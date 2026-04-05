{
  programs.nixvim = {
    diagnostic = {
      settings = {
        signs = {
          text = {
            ERROR = "󰅚";
            WARN = "󰀪";
            INFO = "󰋽";
            HINT = "󰌶";
          };
          severity_sort = true;
        };
      };
    };

    extraConfigLua = ''
      vim.diagnostic.config({
        float = {
          focus = false,
          scope = 'cursor',
        },
        jump = {
          on_jump = vim.diagnostic.open_float,
        },
      })

      local lsp_progress = {}

      vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not client then return end

        local token = result.token
        local val = result.value

        if not lsp_progress[client.name] then
          lsp_progress[client.name] = {}
        end

        if val.kind == "begin" then
          lsp_progress[client.name][token] = {
            title = val.title or "",
            message = val.message or "",
            percentage = val.percentage,
          }
        elseif val.kind == "report" then
          if lsp_progress[client.name][token] then
            lsp_progress[client.name][token].message = val.message or lsp_progress[client.name][token].message
            lsp_progress[client.name][token].percentage = val.percentage or lsp_progress[client.name][token].percentage
          end
        elseif val.kind == "end" then
          lsp_progress[client.name][token] = nil
          if vim.tbl_isempty(lsp_progress[client.name]) then
            lsp_progress[client.name] = nil
          end
        end
      end

      _G.get_lsp_progress = function()
        local parts = {}
        for client_name, tokens in pairs(lsp_progress) do
          for _, data in pairs(tokens) do
            local text = data.title or ""
            if data.message and data.message ~= "" then
              text = text .. " " .. data.message
            end
            if data.percentage then
              text = text .. " " .. math.floor(data.percentage) .. "%%"
            end
            table.insert(parts, text)
          end
        end
        return table.concat(parts, " | ")
      end
    '';

    lsp = {
      onAttach = ''
        if client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win].foldmethod = 'expr'
          vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
      '';

      servers = {
        jsonls = {
          enable = true;
          config = {
            json = {
              validate.enable = true;
              schemas.__raw = "require('schemastore').json.schemas()";
            };
          };
        };
        yamlls = {
          enable = true;
          config = {
            yaml = {
              schemaStore = {
                enable = false;
                url = "";
              };
              schemas.__raw = "require('schemastore').yaml.schemas()";
            };
          };
        };
        nixd.enable = true;
        cssls.enable = true;
        html.enable = true;
        vtsls.enable = true;
        tailwindcss.enable = true;
        gopls.enable = true;
        marksman.enable = true;
        copilot.enable = true;
      };
    };
  };
}
