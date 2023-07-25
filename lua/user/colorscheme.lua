local status_gruvbox_ok, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox_ok then
    print("Gruvbox not found")
    return
end

gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

local my_theme = 'gruvbox'
lvim.transparent_window = true
lvim.builtin.lualine.options.theme = my_theme
lvim.colorscheme = my_theme
