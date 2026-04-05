{pkgs, ...}: {
  programs.nixvim.extraPackages = with pkgs; [
    imagemagick
    lazygit
  ];

  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = false;
      dashboard = {
        enabled = true;
        preset.keys = [
          { icon = " "; key = "f"; desc = "Find File"; action = ":lua Snacks.dashboard.pick('files')"; }
          { icon = " "; key = "n"; desc = "New File"; action = ":ene | startinsert"; }
          { icon = " "; key = "g"; desc = "Find Text"; action = ":lua Snacks.dashboard.pick('live_grep')"; }
          { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
        ];
      };
      image.enabled = true;
      lazygit.enabled = true;
      picker.enabled = true;
      quickfile.enabled = true;
      statuscolumn.enabled = true;
      words.enabled = true;
    };
  };
}
