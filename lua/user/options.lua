local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

vim.scriptencoding = 'utf-8'

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:»"
vim.opt.listchars:append "precedes:«"
vim.opt.listchars:append "tab:→ "
vim.opt.listchars:append "space:·"
vim.opt.termguicolors = true
