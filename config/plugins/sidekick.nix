{
  programs.nixvim = {
    dependencies = {
      "claude-code".enable = false;
      copilot.enable = false;
      gemini.enable = false;
      opencode.enable = false;
    };

    plugins.sidekick = {
      enable = true;
      autoLoad = true;
      settings = {
        copilot = {
          status.level.__raw = "vim.log.levels.OFF";
        };
      };
    };
  };
}
