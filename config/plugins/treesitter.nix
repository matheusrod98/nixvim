{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins.treesitter = {
      enable = true;
      autoLoad = true;
      folding.enable = true;
      highlight.enable = true;
      indent.enable = true;
      nixvimInjections = true;
    };
  };
}
