{pkgs, ...}: let
  md-render = pkgs.vimUtils.buildVimPlugin {
    name = "md-render.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "delphinus";
      repo = "md-render.nvim";
      rev = "v3.1.1";
      hash = "sha256-Eg2D6sa2UeUtrSmj7mp5Nm9yLGTiNidT4d9MWzXaKLo=";
    };
  };
in {
  programs.nixvim = {
    extraPackages = with pkgs; [
      curl
      ffmpeg
      imagemagick
      mermaid-cli
    ];

    extraPlugins = [md-render];

    autoCmd = [
      {
        event = "FileType";
        pattern = "markdown";
        callback.__raw = ''
          function(args)
            if vim.bo[args.buf].buftype == "" then
              pcall(vim.cmd, "MdRender auto on")
            end
          end
        '';
        desc = "Auto-enable md-render for markdown files (real file buffers only)";
      }
    ];
  };
}
