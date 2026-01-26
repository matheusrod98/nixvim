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
          enabled = true;
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
      };
    };
  };
}
