{
  description = "My nixvim configuration";

  inputs = {
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    git-hooks,
    home-manager,
    nixpkgs,
    nixvim,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    mkHomeManagerConfig = {
      system,
      username ? "nixvim",
      homeDirectory ? "/tmp/nixvim",
    }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {inherit system;};

        modules = [
          nixvim.homeModules.nixvim
          ./config
          {
            home = {
              inherit username homeDirectory;
              stateVersion = "25.05";
            };
            programs.home-manager.enable = true;
          }
        ];
      };
  in {
    homeModules.default = {
      imports = [
        nixvim.homeModules.nixvim
        ./config
      ];
    };

    checks = forAllSystems (
      system: let
        hmConfig = mkHomeManagerConfig {inherit system;};
        pre-commit = git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
            statix.enable = true;
            deadnix.enable = true;
          };
        };
      in {
        default = hmConfig.config.programs.nixvim.build.test;
        format = pre-commit;
      }
    );

    packages = forAllSystems (
      system: let
        hmConfig = mkHomeManagerConfig {inherit system;};
      in {
        default = hmConfig.config.programs.nixvim.build.package;
      }
    );

    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system;};
        pre-commit = git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
            statix.enable = true;
            deadnix.enable = true;
          };
        };
      in {
        default = pkgs.mkShell {
          inherit (pre-commit) shellHook;
          packages =
            pre-commit.enabledPackages
            ++ (with pkgs; [
              nil
            ]);
        };
      }
    );
  };
}
