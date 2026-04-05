{
  programs.nixvim.extraConfigLua = ''
    vim.opt.diffopt:append('vertical')
    vim.opt.diffopt:append('algorithm:histogram')
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
    writebackup = false;
    mouse = "a";
    splitbelow = true;
    splitright = true;
    wrap = false;
    laststatus = 3;
    signcolumn = "yes";
    winborder = "rounded";
    pumborder = "rounded";
    wildignorecase = true;
    wildoptions = "pum,fuzzy";
    wildmode = "noselect:full";
    pumheight = 8;
    complete = ".,w,b,u,t,o";
    completeopt = "fuzzy,menuone,noselect,popup";
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
}
