{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
      };
      sections = {
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
          { __raw = ''
            function()
              local progress = _G.get_lsp_progress()
              if progress == "" then return "" end
              return progress
            end
          ''; }
        ];
      };
    };
  };
}
