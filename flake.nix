{
  description = "My nixvim configuration";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixvim,
    ...
  }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      mkHomeManagerConfig = system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };

          modules = [
            nixvim.homeModules.nixvim
            ./config
            {
              home.username = "nixvim";
              home.homeDirectory = "/tmp/nixvim";
              home.stateVersion = "25.05";
              programs.home-manager.enable = true;
            }
          ];
        };
    in
    {
      homeModules.default = {
        imports = [
          nixvim.homeModules.nixvim
          ./config
        ];
      };

      checks = forAllSystems (
        system:
        let
          hmConfig = mkHomeManagerConfig system;
        in
        {
          default = hmConfig.config.programs.nixvim.build.test;
        }
      );

      packages = forAllSystems (
        system:
        let
          hmConfig = mkHomeManagerConfig system;
        in
        {
          default = hmConfig.config.programs.nixvim.build.package;
        }
      );
    };
}
