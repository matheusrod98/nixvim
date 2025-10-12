{
  description = "My nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixvim, ... }: {
    homeManagerModules.default = {
      imports = [ 
        nixvim.homeManagerModules.nixvim 
        ./config
      ];
    };
  };
}
