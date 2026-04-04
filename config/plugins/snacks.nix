{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      imagemagick
      lazygit
    ];

    plugins.snacks = {
      enable = true;

      settings = {
        bigfile.enabled = false;
        notifier.enabled = false;

        bufdelete.enabled = true;

        dashboard = {
          enabled = true;
          preset.keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action.__raw = ''function() Snacks.picker.files() end'';
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action.__raw = ''function() Snacks.picker.grep() end'';
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action.__raw = ''function() Snacks.picker.recent() end'';
            }
            {
              icon = " ";
              key = "c";
              desc = "Config";
              action.__raw = ''function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end'';
            }
            {
              icon = "󰒲 ";
              key = "l";
              desc = "LazyGit";
              action.__raw = ''function() Snacks.lazygit.open() end'';
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
          sections = [
            {
              section = "header";
            }
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              icon = " ";
              title = "Recent Files";
              section = "recent_files";
              indent = 2;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              indent = 2;
              padding = 1;
              pick = false;
              session = false;
            }
            {
              section = "startup";
            }
          ];
        };

        image.enabled = true;
        lazygit.enabled = true;
        picker = {
          enabled = true;
          ui_select = true;
        };

        quickfile.enabled = true;
        statuscolumn.enabled = true;
        words.enabled = true;
      };
    };
  };
}
