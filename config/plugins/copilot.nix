{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    nodejs
  ];

  plugins = {
    copilot-vim = {
      enable = true;
    };
  };

  extraConfigLua = ''
    vim.g.copilot_node_command = "node"
  '';
}
