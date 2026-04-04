{
  programs.nixvim.diagnostic = {
    settings = {
      signs = {
        text = {
          ERROR = "󰅚";
          WARN = "󰀪";
          INFO = "󰋽";
          HINT = "󰌶";
        };
      };
    };
  };

  programs.nixvim.lsp = {
    onAttach = ''
      if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, bufnr)
      end
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
            validate = {
              enable = true;
            };
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
      copilot = {
        enable = true;
      };
    };
  };
}
