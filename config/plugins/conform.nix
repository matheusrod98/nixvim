{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      clang-tools
      commitmsgfmt
      dockerfmt
      gofumpt
      nixfmt
      prettier
      ruff
      shfmt
      sqlfluff
      stylua
      yamlfmt
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          c = ["clang-format"];
          cpp = ["clang-format"];
          dockerfile = ["dockerfmt"];
          gitcommit = ["commitmsgfmt"];
          go = ["gofumpt"];
          json = ["prettier"];
          jsonc = ["prettier"];
          markdown = ["markdownfmt"];
          lua = ["stylua"];
          nix = ["nixfmt"];
          python = ["ruff_format"];
          sh = ["shfmt"];
          bash = ["shfmt"];
          zsh = ["shfmt"];
          sql = ["sqlfluff"];
          toml = ["taplo"];
          javascript = ["prettier"];
          javascriptreact = ["prettier"];
          typescript = ["prettier"];
          typescriptreact = ["prettier"];
          yaml = ["yamlfmt"];
          "yaml.openapi" = ["yamlfmt"];
        };
      };
    };
  };
}
