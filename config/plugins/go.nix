{pkgs, ...}: let
  go-enum = pkgs.buildGoModule rec {
    pname = "go-enum";
    version = "0.9.2";

    src = pkgs.fetchFromGitHub {
      owner = "abice";
      repo = "go-enum";
      rev = "v${version}";
      hash = "sha256-VZH7xLEDqU8N7oU3tOWVdTABEQEp2mlh1NtTg22hzco=";
    };

    vendorHash = "sha256-bqJ+KBUsJzTNqeshq3eXFImW/JYL7zmCEwcy2xQHJeE=";
  };

  gomvp = pkgs.buildGoModule rec {
    pname = "gomvp";
    version = "0.0.4";

    src = pkgs.fetchFromGitHub {
      owner = "abenz1267";
      repo = "gomvp";
      rev = "v${version}";
      hash = "sha256-dXjI+nItJCAGKxyC9tX11hxWHCP+NgXtTYtm5+6dqDU=";
    };

    vendorHash = null;
  };

  gojsonstruct = pkgs.buildGoModule rec {
    pname = "gojsonstruct";
    version = "3.3.0";

    src = pkgs.fetchFromGitHub {
      owner = "twpayne";
      repo = "go-jsonstruct";
      rev = "v${version}";
      hash = "sha256-mNZAezLKMrgnzsRikrZhmjTuF+B1ob5Bjh33voNsyCs=";
    };

    subPackages = ["cmd/gojsonstruct"];
    vendorHash = "sha256-5gtUZfXrob+4IJYrugjDJl6TJ1wYW5Occ1P6mRJBHjA=";
  };

  json-to-struct = pkgs.buildGoModule rec {
    pname = "json-to-struct";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "tmc";
      repo = "json-to-struct";
      rev = "v${version}";
      hash = "sha256-7zvWUVo0w+eXyNLP1mnoLMWnyfc3xQIMgK+eD/yCSeU=";
    };

    vendorHash = "sha256-fj0gTSKG38GYyScHfT4gh512mm1uv1Sunqs3P8V7e4U=";
  };
in {
  programs.nixvim = {
    extraPackages = with pkgs; [
      curl
      gnused
      gofumpt
      golangci-lint
      gomodifytags
      gotests
      gotestsum
      gotools
      govulncheck
      iferr
      impl
      delve
      ginkgo
      mockgen
      reftools
      go-enum
      gomvp
      gojsonstruct
      json-to-struct
    ];

    extraPlugins = with pkgs.vimPlugins; [
      go-nvim
    ];

    plugins.lz-n.plugins = [
      {
        __unkeyed-1 = "go.nvim";
        ft = [ "go" "gomod" "gosum" "gowork" "gotmpl" ];
        after.__raw = ''
          function()
            require("go").setup({
              lsp_cfg = false,
              textobjects = false,
              lsp_inlay_hints = { enable = false },
              lsp_codelens = false,
              dap_debug = false,
              dap_debug_gui = false,
              dap_debug_vt = false,
              gofmt = "gofumpt",
              goimports = "goimports",
            })
          end
        '';
      }
    ];
  };
}
