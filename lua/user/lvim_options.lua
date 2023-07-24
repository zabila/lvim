lvim.log.level = "warn"
lvim.format_on_save = true

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.luasnip.sources.friendly_snippets = true

-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true
--

lvim.builtin.cmp.sources = {
    {
        name = "nvim_lsp",
        entry_filter = function(entry, _)
            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" then
                return false
            end
            return true
        end,
    },

    { name = "path" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
    { name = "tmux" },
    {
        name = "copilot",
        -- keyword_length = 0,
        max_item_count = 3,
        trigger_characters = {
            {
                ".",
                ":",
                "(",
                "'",
                '"',
                "[",
                ",",
                "#",
                "*",
                "@",
                "|",
                "=",
                "-",
                "{",
                "/",
                "\\",
                "+",
                "?",
                " ",
                -- "\t",
                -- "\n",
            },
        },
    },
}
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
