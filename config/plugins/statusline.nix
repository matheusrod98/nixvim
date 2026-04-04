{
  programs.nixvim.opts = {
    laststatus = 3;
    showcmdloc = "statusline";
    statusline = "%{%v:lua.nixvim_config_helpers.mode_status()%}%<%f %h%w%m%r%{%v:lua.nixvim_config_helpers.diff_status()%}%{%v:lua.require('vim._core.util').term_exitcode()%}%=%{%v:lua.nixvim_config_helpers.sidekick_status()%}%{v:lua.nixvim_config_helpers.progress_status()}%{%&showcmdloc == 'statusline' ? '%-10.S ' : ''%}%{%&busy > 0 ? '◐ ' : ''%}%{v:lua.nixvim_config_helpers.diagnostic_status()}%{%&ruler ? (&rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat) : ''%}";
  };
}
