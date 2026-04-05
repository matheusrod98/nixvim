{
  programs.nixvim = {
    extraConfigLuaPost = ''
      local ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
      if ok then
        textobjects.setup({
          select = {
            lookahead = true,
          },
          move = {
            set_jumps = true,
          },
        })
      end
    '';

    plugins.treesitter-textobjects = {
      enable = true;
      autoLoad = true;
    };
  };
}
