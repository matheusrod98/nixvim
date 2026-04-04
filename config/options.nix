{
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
    showmode = false;
    updatetime = 250;
    timeoutlen = 300;
  };

  programs.nixvim.globals = {
    mapleader = " ";
    netrw_banner = 0;
    have_nerd_font = true;
  };
}
