{pkgs, ...}: {
  home.file.".config/codebook/codebook.toml".text = ''
    dictionaries = ["en_us", "pt_br"]
  '';

  programs.nixvim.extraPackages = with pkgs; [
    basedpyright
    bash-language-server
    clang-tools
    dockerfile-language-server
    lua-language-server
    marksman
    nixd
    sqls
    taplo
    vtsls
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
            filetypes = [
              "yaml"
              "yaml.openapi"
            ];

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
        basedpyright.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        sqls.enable = true;
        taplo.enable = true;
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
