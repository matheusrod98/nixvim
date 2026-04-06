{
  programs.nixvim.autoCmd = [
    {
      event = "VimResized";
      command = "wincmd =";
      desc = "Equalize window sizes after resizing Vim";
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      callback.__raw = "function() vim.hl.on_yank({ timeout = 200 }) end";
    }
    {
      event = "VimLeavePre";
      desc = "Restore terminal default cursor on exit";
      callback.__raw = ''
        function()
          vim.cmd('set guicursor=a:ver25-blinkon1')
        end
      '';
    }
    {
      event = "FileType";
      pattern = [ "markdown" "text" "gitcommit" "rst" ];
      desc = "Enable spell checking for prose filetypes";
      callback.__raw = ''
        function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us,pt_br"
        end
      '';
    }
  ];
}
