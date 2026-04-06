{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "van";
      options.desc = "Expand selection";
    }
    {
      mode = "x";
      key = "<Tab>";
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
