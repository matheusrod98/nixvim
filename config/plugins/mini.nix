{
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      surround = {
        enable = true;
      };
      diff = {
        enable = true;
        view = {
          style = "sign";
          signs = {
            add = "┃";
            change = "┃";
            delete = "▁";
          };
        };
      };
    };
  };
}
