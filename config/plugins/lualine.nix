{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "lsp_status" "encoding" "fileformat" "filetype" ];
        lualine_y = [ "searchcount" "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
