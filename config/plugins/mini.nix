{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      modules = {
        surround = {
          enable = true;
        };
        diff = {
          enable = true;
          view = {
            style = "sign";
            signs = {
              add = "┃";
              change = "┃";
              delete = "▁";
            };
          };
        };
        statusline = {
          use_icons = false;
          content = {
            active.__raw = ''
              function()
                local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                local git = MiniStatusline.section_git({ trunc_width = 40 })
                local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                local filename = vim.bo.buftype == 'terminal' and '%t' or '%f%m%r'
                local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                local location = MiniStatusline.section_location({ trunc_width = 75 })

                return MiniStatusline.combine_groups({
                  { hl = mode_hl, strings = { mode } },
                  { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
                  '%<',
                  { hl = 'MiniStatuslineFilename', strings = { filename } },
                  '%=',
                  { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                  { hl = mode_hl, strings = { location } },
                })
              end
            '';
            inactive.__raw = ''
              function()
                return '%#MiniStatuslineInactive#%f%='
              end
            '';
          };
        };
      };
    };

    mini-pick = {
      enable = true;
      settings = {
        source.show.__raw = "require('mini.pick').default_show";
      };
    };

    mini-extra.enable = true;
  };
}
