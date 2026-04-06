{pkgs, ...}: {
  imports = [
    ./globals.nix
    ./options.nix
    ./filetype.nix
    ./helpers.nix
    ./keys.nix
    ./autocmd.nix
    ./lsp.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    plugins.lz-n.enable = true;
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        luaLib = true;
        nvimRuntime = true;
        plugins = true;
      };
    };

    nixpkgs.config = {
      allowUnfree = true;
    };

    extraPackages = with pkgs; [
      fd
      ripgrep
      quicktype
      lua51Packages.luarocks
      lua51Packages.lua
      hunspell
      hunspellDicts.en_US
      hunspellDicts.pt_BR
    ];
  };
}
