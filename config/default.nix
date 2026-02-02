{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    vimAlias = true;
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
    imports = [
      ./options.nix
      ./keymaps.nix
      ./autocmds.nix
      ./lsp.nix
      ./plugins
      ./languages.nix
    ];

    nixpkgs.config = {
      allowUnfree = true;
    };

    extraPackages = with pkgs; [
      # Faster :find and :grep
      fd
      ripgrep

      # JSON -> Language type
      quicktype

      # Lua
      lua51Packages.luarocks
      lua51Packages.lua
    ];
  };
}
