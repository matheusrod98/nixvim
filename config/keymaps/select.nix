{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<Enter>";
      action = "van";
      options.desc = "Expand selection";
    }
    {
      mode = "x";
      key = "<Enter>";
      action = "an";
      options.desc = "Expand selection";
    }
    {
      mode = "x";
      key = "<BS>";
      action = "in";
      options.desc = "Shrink selection";
    }
  ];
}
