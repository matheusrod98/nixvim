{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      nvim-vtsls
    ];

    extraConfigLuaPre = ''
      require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    '';

    plugins.lz-n.plugins = [
      {
        __unkeyed-1 = "nvim-vtsls";
        ft = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
        ];
        after.__raw = ''
          function()
            local vtsls_group = vim.api.nvim_create_augroup("nixvim-vtsls", { clear = true })
            local ts_commands = {
              "TSRestartServer",
              "TSOpenServerLog",
              "TSReloadProjects",
              "TSSelectVersion",
              "TSProjectConfig",
              "TSSourceDefinition",
              "TSFileReferences",
              "TSRenameFile",
              "TSOrganizeImports",
              "TSSortImports",
              "TSRemoveUnusedImports",
              "TSFixAll",
              "TSRemoveUnused",
              "TSAddMissingImports",
              "TSSourceActions",
              "TSRenamePath",
            }

            vim.api.nvim_create_autocmd("LspAttach", {
              group = vtsls_group,
              callback = function(args)
                if not args.data or not args.data.client_id then
                  return
                end

                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local vtsls_name = require("vtsls.config").get().name
                if not client or client.name ~= vtsls_name then
                  return
                end

                local bufnr = args.buf

                vim.schedule(function()
                  pcall(vim.api.nvim_buf_del_user_command, bufnr, "VtsExec")
                  pcall(vim.api.nvim_del_user_command, "VtsRename")

                  vim.api.nvim_buf_create_user_command(bufnr, "TSRestartServer", function()
                    require("vtsls").commands.restart_tsserver(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Restart TypeScript server",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSOpenServerLog", function()
                    require("vtsls").commands.open_tsserver_log(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Open TypeScript server log",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSReloadProjects", function()
                    require("vtsls").commands.reload_projects(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Reload TypeScript projects",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSSelectVersion", function()
                    require("vtsls").commands.select_ts_version(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Select TypeScript version",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSProjectConfig", function()
                    require("vtsls").commands.goto_project_config(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Open tsconfig or jsconfig",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSSourceDefinition", function()
                    require("vtsls").commands.goto_source_definition(
                      vim.api.nvim_get_current_win(),
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Go to source definition",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSFileReferences", function()
                    require("vtsls").commands.file_references(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Show file references",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSRenameFile", function()
                    require("vtsls").commands.rename_file(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Rename current file and update imports",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSOrganizeImports", function()
                    require("vtsls").commands.organize_imports(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Organize imports",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSSortImports", function()
                    require("vtsls").commands.sort_imports(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Sort imports",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSRemoveUnusedImports", function()
                    require("vtsls").commands.remove_unused_imports(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Remove unused imports",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSFixAll", function()
                    require("vtsls").commands.fix_all(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Apply all TypeScript fixes",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSRemoveUnused", function()
                    require("vtsls").commands.remove_unused(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Remove unused code",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSAddMissingImports", function()
                    require("vtsls").commands.add_missing_imports(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Add missing imports",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSSourceActions", function()
                    require("vtsls").commands.source_actions(
                      bufnr,
                      function() end,
                      function(err)
                        vim.notify(type(err) == "string" and err or vim.inspect(err), vim.log.levels.ERROR)
                      end
                    )
                  end, {
                    desc = "Show TypeScript source actions",
                    force = true,
                  })

                  vim.api.nvim_buf_create_user_command(bufnr, "TSRenamePath", function(opts)
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
                  end, {
                    complete = "file",
                    desc = "Rename file or folder and update imports",
                    force = true,
                    nargs = "+",
                  })

                  vim.b[bufnr].ts_vtsls_commands = true
                end)
              end,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vtsls_group,
              callback = function(args)
                if not vim.b[args.buf].ts_vtsls_commands then
                  return
                end

                for _, command in ipairs(ts_commands) do
                  pcall(vim.api.nvim_buf_del_user_command, args.buf, command)
                end

                pcall(vim.api.nvim_del_user_command, "VtsRename")
                vim.b[args.buf].ts_vtsls_commands = nil
              end,
            })
          end
        '';
      }
    ];
  };
}
