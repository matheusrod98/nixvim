{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>tn";
      action.__raw = ''function() require("neotest").run.run() end'';
      options = {
        desc = "Test nearest";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = ''function() require("neotest").run.run(vim.fn.expand("%")) end'';
      options = {
        desc = "Test file";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action.__raw = ''function() require("neotest").run.run_last() end'';
      options = {
        desc = "Test last";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action.__raw = ''function() require("neotest").summary.toggle() end'';
      options = {
        desc = "Test summary";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action.__raw = ''function() require("neotest").run.run({ strategy = "dap" }) end'';
      options = {
        desc = "Debug nearest test";
        silent = true;
      };
    }
  ];
}
