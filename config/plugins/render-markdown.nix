{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      python314Packages.pylatexenc
    ];
    plugins.render-markdown.enable = true;
  };
}
