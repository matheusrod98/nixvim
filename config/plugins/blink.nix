{
  programs.nixvim = {
    opts.autocomplete = false;

    plugins."blink-cmp" = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        completion = {
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
          menu.border = "rounded";
        };

        signature = {
          enabled = true;
          window.border = "rounded";
        };

        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };
  };
}
