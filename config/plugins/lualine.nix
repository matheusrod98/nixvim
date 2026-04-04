{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;
        icons_enabled = true;
        component_separators = "";
        section_separators = "";
        disabled_filetypes.statusline = [ "snacks_dashboard" ];
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          {
            __unkeyed-1 = "diff";
            source.__raw = ''
              function()
                local summary = vim.b.minidiff_summary
                if not summary then
                  return nil
                end

                return {
                  added = summary.add,
                  modified = summary.change,
                  removed = summary.delete,
                }
              end
            '';
            symbols = {
              added = "+";
              modified = "~";
              removed = "-";
            };
          }
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_diagnostic" ];
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            path = 1;
            symbols = {
              modified = "[+]";
              readonly = "[-]";
              unnamed = "[No Name]";
              newfile = "[New]";
            };
          }
        ];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };

      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ];
        lualine_z = [ ];
      };
    };
  };
}
