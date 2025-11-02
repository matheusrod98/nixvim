{
  plugins.mini = {
    enable = true;
    modules = {
      align = {
        enable = true;
      };
      hipatterns = {
        enable = true;
        highlighters = {
          hex_color.__raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
        };
      };
      move = {
        enable = true;
        mappings = {
          left = "<M-S-h>";
          right = "<M-S-l>";
          down = "<M-S-j>";
          up = "<M-S-k>";
          line_left = "<M-S-h>";
          line_right = "<M-S-l>";
          line_down = "<M-S-j>";
          line_up = "<M-S-k>";
        };
      };
      pairs = {
        enable = true;
      };
    };
  };
}
