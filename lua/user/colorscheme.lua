-- Themes list
local themes = {
    gruvbox = "gruvbox",
    rose_pine = "rose-pine",
    lunar = "lunar",
    gruvbox_material = "gruvbox-material",
    onedarker = "onedarker",
    onedark = "onedark",
    horizon = "horizon",
    tokyonight = "tokyonight",
    tokyonight_night = "tokyonight-night",
    tokyonight_day = "tokyonight-day",
    tokyonight_moon = "tokyonight-moon",
    desert = "desert",
    morning = "morning",
    sonokai = "sonokai",
    edge = "edge",
    ayu = "ayu",
}

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

local status_git_ok, github = pcall(require, "github-theme")
if not status_git_ok then
    print("Don't have github-theme installed")
    return
end

github.setup({
    options = {
        styles = {
            comments = 'italic',
            strings = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
        }
    }
})

local my_theme = themes.gruvbox
lvim.transparent_window = false

lvim.builtin.lualine.options.theme = my_theme
lvim.colorscheme = my_theme
