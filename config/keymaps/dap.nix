{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action.__raw = ''
        function()
          require("dap").continue()
        end
      '';
      options = {
        desc = "Debug: Continue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F10>";
      action.__raw = ''
        function()
          require("dap").step_over()
        end
      '';
      options = {
        desc = "Debug: Step over";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F11>";
      action.__raw = ''
        function()
          require("dap").step_into()
        end
      '';
      options = {
        desc = "Debug: Step into";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<F12>";
      action.__raw = ''
        function()
          require("dap").step_out()
        end
      '';
      options = {
        desc = "Debug: Step out";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = ''
        function()
          require("dap").continue()
        end
      '';
      options = {
        desc = "Debug: Continue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = ''
        function()
          require("dap").toggle_breakpoint()
        end
      '';
      options = {
        desc = "Debug: Toggle breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dB";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end
      '';
      options = {
        desc = "Debug: Conditional breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = ''
        function()
          require("dap").run_last()
        end
      '';
      options = {
        desc = "Debug: Run last";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dq";
      action.__raw = ''
        function()
          require("dap").terminate()
        end
      '';
      options = {
        desc = "Debug: Terminate";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = ''
        function()
          require("dap").repl.toggle()
        end
      '';
      options = {
        desc = "Debug: Toggle REPL";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = ''
        function()
          require("dapui").toggle()
        end
      '';
      options = {
        desc = "Debug: Toggle UI";
        silent = true;
      };
    }
  ];
}
