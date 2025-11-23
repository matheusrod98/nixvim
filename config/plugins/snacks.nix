{ pkgs, ... }:

{
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
        dashboard = {
          enabled = true;
          sections = [
            { section = "header"; }
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
          ];
        };
        image = {
          enabled = false;
        };
        notifier = {
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
}
