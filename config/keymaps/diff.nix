{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "]c";
      action.__raw = ''function() require("mini.diff").goto_hunk("next") end'';
      options = {
        desc = "Next hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[c";
      action.__raw = ''function() require("mini.diff").goto_hunk("prev") end'';
      options = {
        desc = "Previous hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gh";
      action.__raw = ''
        function()
          require("mini.diff").operator("apply")
          vim.api.nvim_feedkeys("_", "n", false)
        end
      '';
      options = {
        desc = "Stage hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action.__raw = ''
        function()
          require("mini.diff").operator("reset")
          vim.api.nvim_feedkeys("_", "n", false)
        end
      '';
      options = {
        desc = "Reset hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action.__raw = ''function() require("mini.diff").toggle_overlay(0) end'';
      options = {
        desc = "Preview hunk (diff overlay)";
        silent = true;
      };
    }
  ];
}
