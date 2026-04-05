{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<CR>";
      action = "van";
      options.desc = "Expand selection";
    }
    {
      mode = "x";
      key = "<CR>";
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
