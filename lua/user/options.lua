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
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
