local options = {
  backup = false,
  swapfile = false,
  writebackup = false,
  number = true,
  mouse = a,
  smartindent = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  list = true,
  tags = "./tags",
  signcolumn = yes,
  fileformat = unix,
  auto_ctags = 1,
}

for k,v in pairs(options) do
  vim.o[k] = v
end

vim.g.mapleader = ","
vim.keymap.set('n','<Esc><Esc>', ':nohl<CR>')

vim.cmd [[highlight FgCocErrorFloatBgCocFloating ctermfg=266]]
vim.cmd [[highlight FgCocInfoFloatBgCocFloating ctermfg=266]]
vim.cmd 'autocmd ColorScheme * highlight Comment ctermfg=gray'
vim.cmd 'autocmd ColorScheme * highlight Visual ctermbg=243'
vim.cmd 'autocmd ColorScheme * highlight lineNr guifg=#a9b1d6'
