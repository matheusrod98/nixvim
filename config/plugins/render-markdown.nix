{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      python314Packages.pylatexenc
    ];
    programs.nixvim.plugins.render-markdown.enable = true;
  };
}
