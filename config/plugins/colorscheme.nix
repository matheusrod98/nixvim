{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    gruvbox-nvim
  ];

  extraConfigLuaPre = ''
    vim.o.background = "dark"
    require('gruvbox').setup({
      contrast = "hard",
      transparent_mode = true,
      overrides = {
        Pmenu = { link = "Normal" },
      },
    })
    vim.cmd('colorscheme gruvbox')
  '';
}
