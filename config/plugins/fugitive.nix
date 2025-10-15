{ pkgs, ... }:

{
  plugins = {
    fugitive = {
      enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    fugitive-gitlab-vim
    vim-rhubarb
  ];
}
