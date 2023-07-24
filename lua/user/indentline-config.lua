lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow = {
    enable = true,
    query = 'rainbow-parens',
    strategy = require 'ts-rainbow.strategy.global',
    max_file_lines = 3000
}
