{
  programs.nixvim.extraConfigLua = ''
    function _G.fd_find(cmdarg, _)
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
  '';

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
    mouse = "a";
    splitbelow = true;
    splitright = true;
    wrap = false;
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
    diffopt = "internal,filler,closeoff,indent-heuristic,inline:char,linematch:40,vertical,algorithm:histogram";
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
