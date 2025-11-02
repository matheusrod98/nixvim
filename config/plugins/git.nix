{ pkgs, ... }:

{
  plugins = {
    fugitive = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    fugitive-gitlab-vim
    vim-rhubarb
  ];
}
