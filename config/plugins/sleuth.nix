{
  programs.nixvim.plugins.sleuth = {
    enable = true;
    lazyLoad.settings = {
      event = "BufReadPost";
    };
  };
}
