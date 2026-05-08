{
  programs.nixvim.opts.autocomplete = false;

  programs.nixvim.plugins."blink-cmp" = {
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

      keymap = {
        "<Tab>" = [
          "snippet_forward"
          {
            __raw = ''
              function()
                return require("sidekick").nes_jump_or_apply()
              end
            '';
          }
          {
            __raw = ''
              function()
                return vim.lsp.inline_completion.get()
              end
            '';
          }
          "fallback"
        ];
      };

      sources.default = [
        "lsp"
        "path"
        "snippets"
        "buffer"
      ];
    };
  };
}
