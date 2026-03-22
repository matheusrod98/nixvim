{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vague-nvim
    ];

    extraConfigLuaPre = ''
      require("vague").setup({
        transparent = true,
      })
      vim.cmd("colorscheme vague")
    '';
  };
}
