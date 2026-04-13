_: {
  programs.nixvim.plugins.neotest = {
    enable = true;

    adapters = {
      go = {
        enable = true;
      };

      jest = {
        enable = true;
      };

      playwright = {
        enable = true;
        settings.options = {};
      };

      vitest = {
        enable = true;
      };
    };
  };
}
