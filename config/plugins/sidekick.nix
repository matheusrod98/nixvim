{
  programs.nixvim.dependencies = {
    "claude-code".enable = false;
    copilot.enable = false;
    gemini.enable = false;
    opencode.enable = false;
  };

  programs.nixvim.plugins.sidekick = {
    enable = true;
    autoLoad = true;
  };
}
