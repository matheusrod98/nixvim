{
  programs.nixvim.extraConfigLua = ''
    vim.cmd.packadd("nvim.difftool")
    vim.cmd.packadd("nvim.undotree")
  '';
}
