{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>zn";
      action = "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>";
      options = {
        desc = "Create new note (timestamp ID)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>zf";
      action = "<cmd>ZkNotes { sort = { 'modified' } }<cr>";
      options = {
        desc = "Browse notes";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>zb";
      action = "<cmd>ZkBacklinks<cr>";
      options = {
        desc = "Backlinks for note under cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>zl";
      action = "<cmd>ZkLinks<cr>";
      options = {
        desc = "Outgoing links for note under cursor";
        silent = true;
      };
    }
  ];
}
