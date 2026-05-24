{
  programs.nixvim.plugins.auto-session = {
    enable = true;
    settings = {
      args_allow_files_auto_save = true;
      auto_save = true;
      auto_restore = true;
    };
  };
}
