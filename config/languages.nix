{ pkgs, ... }:

let
  go-enum = pkgs.buildGoModule rec {
    pname = "go-enum";
    version = "0.6.0";

    src = pkgs.fetchFromGitHub {
      owner = "abice";
      repo = "go-enum";
      rev = "v${version}";
      hash = "sha256-Mt45Qz8l++bvBLKEpbX0m8iTkHDpsZtdYhhHUprQKY8=";
    };

    vendorHash = "sha256-YzIVI+PLZt24s/KjTxifWrvjrIU8jLvkC1lgw4yG6cg=";
  };
in
{
  programs.nixvim.extraPackages = with pkgs; [
    # Golang
    golines
    go-tools
    gomodifytags
    gotest
    iferr
    impl
    reftools
    ginkgo
    gotestsum
    govulncheck
    go-enum
  ];
}
