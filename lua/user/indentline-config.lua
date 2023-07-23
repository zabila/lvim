local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow = {
    enable = true,
    query = 'rainbow-parens',
    strategy = require 'ts-rainbow.strategy.global',
    max_file_lines = 3000
}

-- vim.opt.list = true
-- indent_blankline.setup {
--     show_current_context = true,
--     show_current_context_start = true,
-- }
