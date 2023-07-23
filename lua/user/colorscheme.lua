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

local status_tokionight_ok, tokionight = pcall(require, "tokionight")
if not status_tokionight_ok then
    print("Tokionight don't installed")
end

tokionight.setup({
    style = "storm",
    light_style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        strings = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,

    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end,

    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
            bg = prompt,
        }
        hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
    end,
})

lvim.builtin.lualine.on_config_done = {
    options = {
        theme = 'tokionight'
    }
}

lvim.transparent_window = false
lvim.colorscheme = themes.tokyonight

local extra_opts = {
    sonokai = {
        styles = {
            espresso = "espresso",
            shusia = "shusia",
            default = "default",
        },
    },
    ayu = {
        styles = {
            mirage = "mirage",
            light = "light",
            dark = "dark",
        },
    },
    edge = {
        styles = {
            aura = "aura",
            neon = "neon",
        },
        airline_theme = "edge",
        lualine_theme = "edge",
    },
}

if vim.g.neovide then
    lvim.transparent_window = false
    return
end

if lvim.colorscheme == themes.sonokai then
    vim.g.sonokai_style = "espresso"
    vim.g.sonokai_style = "shusia"
    vim.g.sonokai_style = "default"
end

if lvim.colorscheme == themes.edge then
    vim.g.airline_theme = extra_opts.edge.airline_theme
    vim.g.edge_style = extra_opts.edge.styles.aura
    lvim.builtin.lualine.options.theme = extra_opts.edge.lualine_theme
end

if lvim.colorscheme == themes.ayu then
    vim.g.ayucolor = extra_opts.ayu.styles.mirage
end
