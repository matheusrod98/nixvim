{
  programs.nixvim.dependencies = {
    claude-code.enable = false;
    copilot.enable = false;
    gemini.enable = false;
  };

  programs.nixvim.plugins.sidekick = {
    enable = true;
    autoLoad = true;
    settings = {
      cli = {
        picker = "snacks";
      };
      copilot = {
        status.level.__raw = "vim.log.levels.OFF";
      };
    };
  };
}
