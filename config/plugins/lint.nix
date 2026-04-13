{...}: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      go = [ "golangcilint" ];
    };
  };
}
