{pkgs, ...}: {
  programs.nixvim.plugins.zk = {
    enable = true;
    package = pkgs.vimPlugins.zk-nvim;

    lazyLoad.settings = {
      cmd = [
        "ZkNew"
        "ZkNotes"
        "ZkBacklinks"
        "ZkLinks"
        "ZkCd"
        "ZkMatch"
      ];
      keys = [
        {__unkeyed-1 = "<leader>zn";}
        {__unkeyed-1 = "<leader>zf";}
        {__unkeyed-1 = "<leader>zb";}
        {__unkeyed-1 = "<leader>zl";}
      ];
      ft = "markdown";
    };

    settings = {
      # native snacks.picker adapter (zk-nvim ≥ 0.4)
      picker = "snacks_picker";

      lsp = {
        auto_attach = {
          enabled = true;
          filetypes = ["markdown"];
        };
        config = {
          cmd = ["zk" "lsp"];
          name = "zk";
        };
      };
    };
  };
}
