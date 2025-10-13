{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    gruvbox-nvim
  ];

  extraConfigLuaPre = ''
    vim.o.background = "dark"
    require('gruvbox').setup({
      contrast = "hard",
      transparent_mode = false,
      overrides = {
		SignColumn = { link = "Normal" },
		GruvboxGreenSign = { bg = "" },
		GruvboxOrangeSign = { bg = "" },
		GruvboxPurpleSign = { bg = "" },
		GruvboxYellowSign = { bg = "" },
		GruvboxRedSign = { bg = "" },
		GruvboxBlueSign = { bg = "" },
		GruvboxAquaSign = { bg = "" },
        Pmenu = { link = "Normal" },
      },
    })
    vim.cmd('colorscheme gruvbox')
  '';
}
