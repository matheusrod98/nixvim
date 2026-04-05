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
