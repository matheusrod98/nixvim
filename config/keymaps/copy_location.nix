{
  keymaps = [
    {
      key = "<leader>cp";
      action = "<cmd>lua local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end vim.fn.setreg('+', relative_path) vim.notify(\"Copied to clipboard: \" .. relative_path, vim.log.levels.INFO)<cr>";
      mode = "n";
      options = {
        desc = "Copy relative file path to clipboard";
        silent = true;
      };
    }
    {
      key = "<leader>cl";
      action = "<cmd>lua local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.') if relative_path == \"\" then vim.notify(\"No file in current buffer\", vim.log.levels.WARN) return end local line_number = vim.fn.line(\".\") local file_with_line = relative_path .. \":\" .. line_number vim.fn.setreg('+', file_with_line) vim.notify(\"Copied to clipboard: \" .. file_with_line, vim.log.levels.INFO)<cr>";
      mode = "n";
      options = {
        desc = "Copy relative file path with line number to clipboard";
        silent = true;
      };
    }
  ];
}
