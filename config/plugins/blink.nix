{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "default";
        };
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
        completion = {
          menu = {
            border = "none";
          };
          documentation = {
            auto_show = true;
          };
        };
        signature = {
          enabled = true;
        };
      };
    };
  };
}
