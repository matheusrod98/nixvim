{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    gotools
    go-tools
    mockgen
    govulncheck
    golines
    gotests
    gomodifytags
    richgo
    ginkgo
    gotestsum
    reftools
    impl
  ];

  plugins.typescript-tools = {
    enable = true;
    settings.settings.jsx_close_tag.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    go-nvim
  ];

  extraConfigLuaPre = ''
    require('go').setup({
      diagnostic = false
    })
  '';
}
