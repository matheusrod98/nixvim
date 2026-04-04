{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      ghostscript
      tectonic
      mermaid-cli
    ];

    plugins = {
      snacks = {
        enable = true;
        settings = {
          picker = {
            enabled = true;
            icons = {
              files = {
                enabled = false;
              };
            };
          };
          image = {
            enabled = true;
          };
          bigfile = {
            enabled = true;
          };
          quickfile = {
            enabled = true;
          };
          bufdelete = {
            enabled = true;
          };
          statuscolumn = {
            enabled = true;
          };
        };
      };
    };
  };
}
