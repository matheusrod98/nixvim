{
  programs.nixvim.extraConfigLua = ''
    local function toggle_list(kind, open_cmd, close_cmd)
      for _, win in pairs(vim.fn.getwininfo()) do
        if win[kind] == 1 then
          vim.cmd[close_cmd]()
          return
        end
      end

      vim.cmd[open_cmd]()
    end

    function _G.toggle_quickfix()
      toggle_list('quickfix', 'copen', 'cclose')
    end

    function _G.toggle_location_list()
      toggle_list('loclist', 'lopen', 'lclose')
    end

    function _G.copy_relative_path(with_line)
      local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      if relative_path == "" then
        vim.notify('No file in current buffer', vim.log.levels.WARN)
        return
      end

      local value = relative_path
      if with_line then
        value = relative_path .. ':' .. vim.fn.line('.')
      end

      vim.fn.setreg('+', value)
      vim.notify('Copied to clipboard: ' .. value, vim.log.levels.INFO)
    end
  '';
}
