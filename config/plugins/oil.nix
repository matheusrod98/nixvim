{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        watch_for_changes = true;
        view_options = {
          show_hidden = true;
        };
        columns = [ ];
      };
    };

    extraConfigLuaPost = ''
      local ok, oil = pcall(require,'oil')
      if ok then
        oil.set_columns({})
      end
    '';
  };
}
