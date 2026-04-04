{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = [ { __raw = "{ 'filename', path = 1 }"; } ];
        lualine_x = [
          {
            __raw = ''
              {
                function()
                  return vim.lsp.status()
                end,
              }
            '';
          }
          {
            __raw = ''
              {
                function()
                  local ok, sidekick = pcall(require, "sidekick.status")
                  if not ok or sidekick.get() == nil then
                    return ""
                  end
                  return " "
                end,
                color = function()
                  local ok, sidekick = pcall(require, "sidekick.status")
                  if not ok then
                    return nil
                  end
                  local status = sidekick.get()
                  if not status then
                    return nil
                  end
                  return status.kind == "Error" and "DiagnosticError"
                    or status.busy and "DiagnosticWarn"
                    or "Special"
                end,
              }
            '';
          }
          {
            __raw = ''
              {
                function()
                  local ok, sidekick = pcall(require, "sidekick.status")
                  if not ok then
                    return ""
                  end
                  local status = sidekick.cli()
                  if #status == 0 then
                    return ""
                  end
                  return " " .. (#status > 1 and #status or "")
                end,
                color = "Special",
              }
            '';
          }
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
