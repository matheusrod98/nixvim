{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      checkmake
      commitlint
      cppcheck
      deadnix
      dotenv-linter
      eslint
      hadolint
      markdownlint-cli
      ruff
      shellcheck
      sqlfluff
      statix
      tombi
      yamllint
      luaPackages.luacheck
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "cppcheck" ];
        cpp = [ "cppcheck" ];
        bash = [ "shellcheck" ];
        dockerfile = [ "hadolint" ];
        dotenv = [ "dotenv_linter" ];
        gitcommit = [ "commitlint" ];
        go = [ "golangcilint" ];
        javascript = [ "eslint" ];
        javascriptreact = [ "eslint" ];
        json = [ "jsonlint" ];
        lua = [ "luacheck" ];
        make = [ "checkmake" ];
        markdown = [ "markdownlint" ];
        nix = [ "statix" "deadnix" ];
        python = [ "ruff" ];
        sh = [ "shellcheck" ];
        sql = [ "sqlfluff" ];
        toml = [ "tombi" ];
        typescript = [ "eslint" ];
        typescriptreact = [ "eslint" ];
        yaml = [ "yamllint" ];
        "yaml.openapi" = [ "spectral" ];
        zsh = [ "shellcheck" ];
      };
    };
  };
}
