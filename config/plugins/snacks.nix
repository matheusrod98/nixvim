{pkgs, ...}: {
  programs.nixvim.extraPackages = with pkgs; [
    imagemagick
    lazygit
    ghostscript
    tectonic
    mermaid-cli
    sqlite
  ];

  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = false;
      dashboard = {
        enabled = true;
        preset.keys = [
          {
            icon = " ";
            key = "f";
            desc = "Find File";
            action = ":lua Snacks.dashboard.pick('files')";
          }
          {
            icon = " ";
            key = "n";
            desc = "New File";
            action = ":ene | startinsert";
          }
          {
            icon = " ";
            key = "r";
            desc = "Recent Files";
            action = ":lua Snacks.dashboard.pick('recent')";
          }
          {
            icon = " ";
            key = "g";
            desc = "Find Text";
            action = ":lua Snacks.dashboard.pick('live_grep')";
          }
          {
            icon = " ";
            key = "s";
            desc = "Restore Session";
            section = "session";
          }
          {
            icon = " ";
            key = "q";
            desc = "Quit";
            action = ":qa";
          }
        ];
        sections = [
          {section = "header";}
          {
            section = "session";
            padding = 1;
          }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
      image.enabled = true;
      lazygit.enabled = true;
      styles.lazygit.border = true;
      picker.enabled = true;
      quickfile.enabled = true;
      statuscolumn.enabled = true;
      gitbrowse.enabled = true;
    };
  };
}
