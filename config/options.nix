{
  opts = {
    number = true;
    relativenumber = true;
    scrolloff = 10;
    sidescrolloff = 10;
    signcolumn = "auto:2-5";
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;
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
    wildmode = "longest:full,full";
    pumheight = 8;
    completeopt = "fuzzy,menuone,noinsert,popup";
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldlevelstart = 99;
    inccommand = "split";
    ignorecase = true;
    smartcase = true;
    confirm = true;
    diffopt = "vertical,algorithm:histogram,indent-heuristic,linematch:60";
    grepprg = "rg --vimgrep --smart-case --follow --hidden --glob '!.git/'";
    grepformat = "%f:%l:%c:%m";
    showmode = false;
    updatetime = 250;
    timeoutlen = 300;
  };

  globals = {
    mapleader = " ";
  };

  extraConfigLua = ''
    function _G.FdFindFiles(cmdarg, _cmdcomplete)
      local fnames = vim.fn.systemlist('fd --type f --hidden --color=never')
      if #cmdarg == 0 then
        return fnames
      else
        return vim.fn.matchfuzzy(fnames, cmdarg)
      end
    end
    vim.o.findfunc = 'v:lua.FdFindFiles'

    vim.g.netrw_banner = 0
    vim.g.have_nerd_font = true;
  '';
}
