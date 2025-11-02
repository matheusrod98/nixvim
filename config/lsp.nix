{
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
    local orig_signs_handler = vim.diagnostic.handlers.signs
    vim.diagnostic.handlers.signs = {
      show = function(namespace, bufnr, diagnostics, opts)
        local seen = {}
        local to_show = {}
        for _, diag in ipairs(diagnostics) do
          local key = diag.lnum .. "_" .. diag.severity
          if not seen[key] then
            seen[key] = true
            table.insert(to_show, diag)
          end
        end
        orig_signs_handler.show(namespace, bufnr, to_show, opts)
      end,
      hide = function(namespace, bufnr)
        orig_signs_handler.hide(namespace, bufnr)
      end,
    }
  '';

  lsp = {
    servers = {
      jsonls = {
        enable = true;
        settings = {
          json = {
            validate = {
              enable = true;
            };
            schemas.__raw = "require('schemastore').json.schemas()";
          };
        };
      };
      yamlls = {
        enable = true;
        settings = {
          yaml = {
            schemaStore = {
              enable = false;
              url = "";
            };
            schemas.__raw = "require('schemastore').yaml.schemas()";
          };
        };
      };
      nixd = {
        enable = true;
      };
      cssls = {
        enable = true;
      };
      html = {
        enable = true;
      };
      vtsls = {
        enable = true;
        settings = {
          filetypes = [
            "jsx"
            "js"
          ];
        };
      };
      tailwindcss = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
      marksman = {
        enable = true;
      };
      postgres_lsp = {
        enable = true;
      };
    };
  };
}
