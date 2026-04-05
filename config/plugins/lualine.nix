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
              local status = vim.lsp.status()
              if #status == 0 then return "" end
              local parts = {}
              for _, msg in ipairs(status) do
                local text = msg.title or ""
                if msg.message and msg.message ~= "" then
                  text = text .. " " .. msg.message
                end
                if msg.percentage then
                  text = text .. " " .. math.floor(msg.percentage) .. "%%"
                end
                table.insert(parts, text)
              end
              return table.concat(parts, " | ")
            end
          ''; }
        ];
      };
    };
  };
}
