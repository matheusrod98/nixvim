{
  plugins.mini = {
    enable = true;
    modules = {
      surround = {
        enable = true;
      };
      align = {
        enable = true;
      };
      hipatterns = {
        enable = true;
        highlighters = {
          hex_color.__raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
        };
      };
    };
  };
}
