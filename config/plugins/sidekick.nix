{
  programs.nixvim.plugins.sidekick = {
    enable = true;
    autoLoad = true;
    settings = {
      copilot = {
        status.level.__raw = "vim.log.levels.OFF";
      };
    };
  };
}
