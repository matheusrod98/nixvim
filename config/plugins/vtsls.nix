{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      nvim-vtsls
    ];

    extraConfigLuaPre = ''
      require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    '';

    userCommands = {
      TSRestartServer = {
        desc = "Restart TypeScript server";
        command.__raw = ''
          function()
            require("vtsls").commands.restart_tsserver(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSOpenServerLog = {
        desc = "Open TypeScript server log";
        command.__raw = ''
          function()
            require("vtsls").commands.open_tsserver_log(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSReloadProjects = {
        desc = "Reload TypeScript projects";
        command.__raw = ''
          function()
            require("vtsls").commands.reload_projects(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSSelectVersion = {
        desc = "Select TypeScript version";
        command.__raw = ''
          function()
            require("vtsls").commands.select_ts_version(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSProjectConfig = {
        desc = "Open tsconfig or jsconfig";
        command.__raw = ''
          function()
            require("vtsls").commands.goto_project_config(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSSourceDefinition = {
        desc = "Go to source definition";
        command.__raw = ''
          function()
            require("vtsls").commands.goto_source_definition(
              vim.api.nvim_get_current_win(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSFileReferences = {
        desc = "Show file references";
        command.__raw = ''
          function()
            require("vtsls").commands.file_references(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSRenameFile = {
        desc = "Rename current file and update imports";
        command.__raw = ''
          function()
            require("vtsls").commands.rename_file(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSOrganizeImports = {
        desc = "Organize imports";
        command.__raw = ''
          function()
            require("vtsls").commands.organize_imports(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSSortImports = {
        desc = "Sort imports";
        command.__raw = ''
          function()
            require("vtsls").commands.sort_imports(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSRemoveUnusedImports = {
        desc = "Remove unused imports";
        command.__raw = ''
          function()
            require("vtsls").commands.remove_unused_imports(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSFixAll = {
        desc = "Apply all TypeScript fixes";
        command.__raw = ''
          function()
            require("vtsls").commands.fix_all(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSRemoveUnused = {
        desc = "Remove unused code";
        command.__raw = ''
          function()
            require("vtsls").commands.remove_unused(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSAddMissingImports = {
        desc = "Add missing imports";
        command.__raw = ''
          function()
            require("vtsls").commands.add_missing_imports(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSSourceActions = {
        desc = "Show TypeScript source actions";
        command.__raw = ''
          function()
            require("vtsls").commands.source_actions(
              vim.api.nvim_get_current_buf(),
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };

      TSRenamePath = {
        desc = "Rename file or folder and update imports";
        nargs = "+";
        complete = "file";
        command.__raw = ''
          function(opts)
            if #opts.fargs ~= 2 then
              vim.notify("TSRenamePath expects exactly 2 paths", vim.log.levels.ERROR)
              return
            end

            require("vtsls").rename(
              opts.fargs[1],
              opts.fargs[2],
              function() end,
              function(err)
                vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
              end
            )
          end
        '';
      };
    };
  };
}
