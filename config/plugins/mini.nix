{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
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
        icons = {};
        hipatterns = {
          highlighters = {
            fixme = {
              pattern = "%f[%w]()FIXME()%f[%W]";
              group = "MiniHipatternsFixme";
            };
            hack = {
              pattern = "%f[%w]()HACK()%f[%W]";
              group = "MiniHipatternsHack";
            };
            todo = {
              pattern = "%f[%w]()TODO()%f[%W]";
              group = "MiniHipatternsTodo";
            };
            note = {
              pattern = "%f[%w]()NOTE()%f[%W]";
              group = "MiniHipatternsNote";
            };
            hex_color.__raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
          };
        };
        move = {
          mappings = {
            left = "<M-h>";
            right = "<M-l>";
            down = "<M-j>";
            up = "<M-k>";
            line_left = "<M-h>";
            line_right = "<M-l>";
            line_down = "<M-j>";
            line_up = "<M-k>";
          };
        };
      };
    };
  };
}
