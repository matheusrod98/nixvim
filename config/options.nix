{
  programs.nixvim.extraConfigLua = ''
    function _G.fd_find(cmdarg, _)
      local root = vim.fs.root(0, '.git') or vim.uv.cwd()
      local query = vim.trim(cmdarg)
      if query == "" then
        return {}
      end

      local result = vim.system({
        'fd',
        '--type', 'f',
        '--strip-cwd-prefix',
        '.',
      }, {
        cwd = root,
        text = true,
      }):wait()

      if result.code ~= 0 or not result.stdout then
        return {}
      end

      return vim.fn.matchfuzzy(
        vim.split(result.stdout, '\n', { trimempty = true }),
        query,
        { limit = 50 }
      )
    end
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
    wildignorecase = true;
    wildoptions = "pum,fuzzy";
    wildmode = "list:full";
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
