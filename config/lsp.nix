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
      };
    };
  };

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
