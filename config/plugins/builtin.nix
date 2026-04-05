{
  programs.nixvim.extraConfigLua = ''
    vim.cmd.packadd("cfilter")
    vim.cmd.packadd("nvim.difftool")
    vim.cmd.packadd("nvim.undotree")

    require("vim._core.ui2").enable({
      enable = true,
      msg = { targets = "cmd" },
    })
  '';
}
