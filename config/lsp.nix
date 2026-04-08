{pkgs, ...}: {
  home.file.".config/codebook/codebook.toml".text = ''
    dictionaries = ["en_us", "pt_br"]
  '';

  programs.nixvim.extraPackages = with pkgs; [
    inotify-tools
  ];

  programs.nixvim = {
    diagnostic = {
      settings = {
        severity_sort = true;
        signs = {
          text = {
            ERROR = "󰅚";
            WARN = "󰀪";
            INFO = "󰋽";
            HINT = "󰌶";
          };
        };
        float = {
          focus = false;
          scope = "cursor";
        };
        jump = {
          on_jump.__raw = "vim.diagnostic.open_float";
        };
      };
    };

    lsp = {
      onAttach = ''
        if client:supports_method('textDocument/foldingRange') and not vim.wo.diff then
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
        gopls = {
          enable = true;
          config = {
            settings = {
              gopls = {
                staticcheck = true;
                matcher = "Fuzzy";
                symbolMatcher = "FastFuzzy";
                usePlaceholders = true;
                completeUnimported = true;
                vulncheck = "Imports";
                gofumpt = true;
                analyses = {
                  useany = true;
                  unusedvariable = true;
                  shadow = true;
                };
                codelenses = {
                  generate = true;
                  gc_details = true;
                  test = true;
                  tidy = true;
                  vendor = true;
                  regenerate_cgo = true;
                  upgrade_dependency = true;
                };
                hints = {
                  assignVariableTypes = true;
                  compositeLiteralFields = true;
                  compositeLiteralTypes = true;
                  constantValues = true;
                  functionTypeParameters = true;
                  parameterNames = true;
                  rangeVariableTypes = true;
                };
                diagnosticsDelay = "250ms";
                diagnosticsTrigger = "Save";
              };
            };
          };
        };
        marksman.enable = true;
        codebook = {
          enable = true;
          config = {
            filetypes = [
              "c"
              "css"
              "go"
              "haskell"
              "html"
              "java"
              "javascript"
              "javascriptreact"
              "lua"
              "php"
              "python"
              "ruby"
              "rust"
              "swift"
              "toml"
              "typescript"
              "typescriptreact"
              "zig"
            ];
          };
        };
        copilot.enable = true;
      };
    };
  };
}
