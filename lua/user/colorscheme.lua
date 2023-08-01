local my_theme = 'catppuccin'
local my_transparent = true

-- ======================= - Settings of themes - ===============================
local status_gruvbox_ok, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox_ok then
    print("Gruvbox not found")
    my_theme = 'lunnar'
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
    transparent_mode = my_transparent,
})

local status_catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not status_catppuccin_ok then
    print("catppuccin not found")
    my_theme = 'lunnar'
    return
end

catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = my_transparent, -- disables setting the background color.
    show_end_of_buffer = false,              -- shows the '~' characters after the end of buffers
    term_colors = false,                     -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,                     -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,                   -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,                       -- Force no italic
    no_bold = false,                         -- Force no bold
    no_underline = false,                    -- Force no underline
    styles = {                               -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },             -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
    },
})

lvim.transparent_window = my_transparent
lvim.builtin.lualine.options.theme = my_theme
lvim.colorscheme = my_theme
