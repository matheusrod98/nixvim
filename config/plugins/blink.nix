{
  programs.nixvim = {
    opts.autocomplete = false;

    plugins."blink-cmp" = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-e>" = [ "hide" ];
          "<CR>" = [
            "select_and_accept"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];
          "<Down>" = [
            "select_next"
            "fallback"
          ];
          "<C-p>" = [
            "select_prev"
            "fallback"
          ];
          "<C-n>" = [
            "select_next"
            "fallback"
          ];
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };

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

        appearance = {
          use_nvim_cmp_as_default = true;
          nerd_font_variant = "normal";
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
