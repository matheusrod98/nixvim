{
  plugins.lualine = {
    enable = true;
    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = [ { __raw = "{ 'filename', path = 1 }"; } ];
        lualine_x = {
          __raw = "{}";
        };
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
