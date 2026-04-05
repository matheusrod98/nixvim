{pkgs, ...}: {
  programs.nixvim.extraPackages = with pkgs; [
    imagemagick
    lazygit
  ];

  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = false;
      dashboard.enabled = true;
      image.enabled = true;
      lazygit.enabled = true;
      picker.enabled = true;
      quickfile.enabled = true;
      statuscolumn.enabled = true;
      words.enabled = true;
    };
  };
}
