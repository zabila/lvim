lvim.log.level = "warn"
lvim.format_on_save = true

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    "CMakelists.txt",
    ".git",
}

lvim.builtin.telescope.defaults.path_display = {
    shorten = 4,
}

-- Lualine settings
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.sections = {
    lualine_a = {
        -- components.mode,
        "mode",
    },
    lualine_b = {
        components.branch,
        components.filename,
    },
    lualine_c = {
        components.diff,
        components.python_env,
    },
    lualine_x = {
        components.diagnostics,
        components.treesitter,
        components.lsp,
        components.filetype,
        "fileformat",
        components.encoding,
    },
    lualine_y = {
        components.progress,
    },
    lualine_z = {
        -- components.scrollbar,
        components.location,
    },
}
