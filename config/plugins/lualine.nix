{
  programs.nixvim.extraConfigLuaPre = ''
    local macro_recording = ""

    function _G.nixvim_macro_recording()
      return macro_recording
    end

    local function refresh_lualine()
      local ok, lualine = pcall(require, "lualine")
      if ok then
        lualine.refresh({ place = { "statusline" } })
      end
    end

    vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
      group = vim.api.nvim_create_augroup("nixvim_lualine_macro_recording", { clear = true }),
      callback = function(ev)
        if ev.event == "RecordingEnter" then
          macro_recording = "Recording @" .. vim.fn.reg_recording()
        else
          macro_recording = ""
        end

        refresh_lualine()
      end,
    })
  '';

  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "lsp_status" "encoding" "fileformat" "filetype" ];
        lualine_y = [ "nixvim_macro_recording()" "searchcount" "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
