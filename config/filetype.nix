{
  programs.nixvim.filetype = {
    extension = {
      env = "dotenv";
    };

    filename = {
      ".env" = "dotenv";
      "env" = "dotenv";
    };

    pattern = {
      "[jt]sconfig.*.json" = "jsonc";
      "%.env%.[%w_.-]+" = [
        "dotenv"
        {priority = 1000;}
      ];
    };
  };
}
