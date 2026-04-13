{
  programs.nixvim.filetype = {
    filename = {
      "openapi.yaml" = "yaml.openapi";
      "openapi.yml" = "yaml.openapi";
      "swagger.yaml" = "yaml.openapi";
      "swagger.yml" = "yaml.openapi";
    };

    pattern = {
      ".*%.env.*" = "dotenv";
      "[jt]sconfig.*.json" = "jsonc";
    };
  };
}
