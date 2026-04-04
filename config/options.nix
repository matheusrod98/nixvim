{
  programs.nixvim.extraConfigLua = ''
    function _G.fd_find(cmdarg, cmdcomplete)
      local cwd = vim.fn.getcwd()
      local query = vim.trim(cmdarg)

      local result = vim.system({
        'fd',
        '--type', 'f',
        '--hidden',
        '--color', 'never',
      }, {
        cwd = cwd,
        text = true,
      }):wait()

      if result.code ~= 0 or not result.stdout then
        return {}
      end

      local files = vim.split(result.stdout, '\n', { trimempty = true })

      if cmdcomplete then
        if #query < 2 then
          return {}
        end

        local matches = vim.fn.matchfuzzy(files, query)
        local limited = {}

        for i = 1, math.min(#matches, 12) do
          limited[i] = matches[i]
        end

        return limited
      end

      if query == "" then
        return files
      end

      return vim.fn.matchfuzzy(
        files,
        query
      )
    end

    local function toggle_list(kind, open_cmd, close_cmd)
      for _, win in pairs(vim.fn.getwininfo()) do
        if win[kind] == 1 then
          vim.cmd[close_cmd]()
          return
        end
      end

      vim.cmd[open_cmd]()
    end

    function _G.toggle_quickfix()
      toggle_list('quickfix', 'copen', 'cclose')
    end

    function _G.toggle_location_list()
      toggle_list('loclist', 'lopen', 'lclose')
    end

    function _G.copy_relative_path(with_line)
      local relative_path = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      if relative_path == "" then
        vim.notify('No file in current buffer', vim.log.levels.WARN)
        return
      end

      local value = relative_path
      if with_line then
        value = relative_path .. ':' .. vim.fn.line('.')
      end

      vim.fn.setreg('+', value)
      vim.notify('Copied to clipboard: ' .. value, vim.log.levels.INFO)
    end

    vim.diagnostic.config({
      jump = {
        float = {
          scope = 'cursor',
          source = 'if_many',
        },
      },
    })

    vim.opt.diffopt:append('vertical')
    vim.opt.diffopt:append('algorithm:histogram')
  '';

  programs.nixvim.filetype = {
    extension = {
      env = "dotenv";
    };

    filename = {
      ".env" = "dotenv";
      "env" = "dotenv";
    };

    pattern = {
      "[jt]sconfig.*.json" = "jsonc";
      "%.env%.[%w_.-]+" = [
        "dotenv"
        { priority = 1000; }
      ];
    };
  };

  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    scrolloff = 8;
    sidescrolloff = 8;
    tabstop = 4;
    shiftwidth = 4;
    breakindent = true;
    smartindent = true;
    undofile = true;
    swapfile = false;
    writebackup = false;
    mouse = "a";
    splitbelow = true;
    splitright = true;
    wrap = false;
    laststatus = 3;
    signcolumn = "yes";
    statusline = "%<%f %h%w%m%r %{% v:lua.require('vim._core.util').term_exitcode() %}%=%{% luaeval('(package.loaded[''vim.ui''] and vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin or -1) and vim.ui.progress_status()) or '''' ')%}%{% &showcmdloc == 'statusline' ? '%-10.S ' : '' %}%{% exists('b:keymap_name') ? '<'..b:keymap_name..'> ' : '' %}%{% &busy > 0 ? '◐ ' : '' %}%{% luaeval('(package.loaded[''vim.diagnostic''] and next(vim.diagnostic.count()) and vim.diagnostic.status() .. '' '') or '''' ') %}%{empty(get(b:, 'minidiff_summary_string', '')) ? '' : get(b:, 'minidiff_summary_string', '') . ' '}%{% &ruler ? ( &rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat ) : '' %}";
    winborder = "rounded";
    pumborder = "rounded";
    wildignorecase = true;
    wildoptions = "pum,fuzzy";
    wildmode = "noselect:full";
    autocomplete = true;
    pumheight = 8;
    complete = ".,w,b,u,t,o";
    completeopt = "fuzzy,menuone,noselect,popup";
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldlevelstart = 99;
    inccommand = "split";
    ignorecase = true;
    smartcase = true;
    confirm = true;
    grepprg = "rg --vimgrep --smart-case $*";
    grepformat = "%f:%l:%c:%m";
    findfunc = "v:lua.fd_find";
    updatetime = 250;
    timeoutlen = 300;
  };

  programs.nixvim.globals = {
    mapleader = " ";
    netrw_banner = 0;
    have_nerd_font = true;
  };
}
