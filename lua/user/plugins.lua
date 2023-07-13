lvim.plugins = {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestions = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        commit = 'ae099d5844b005cec66a66ab30a44d3bf8867af9', --NOTE: Fixed Lspsaga lsp_finder.
        config = function()
            require('lspsaga').init_lsp_saga()
        end,
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({})
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle"
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            })
        end,
    },
    "christoomey/vim-tmux-navigator",
    "ThePrimeagen/harpoon",
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop').setup()
        end
    },
    "easymotion/vim-easymotion",
    {
        'LukasPietzschmann/telescope-tabs',
        config = function()
            require 'telescope-tabs'.setup {
                -- Your custom config :^)
            }
        end
    },
    {
        "peterhoeg/vim-qml",
        event = "BufRead",
        ft = { "qml" },
    },
    {
        "zabila/git-worktree.nvim",
        config = function()
            local opt = {
                change_directory_command = "cd",                   -- default: "cd"
                update_on_change = true,                           -- default: true
                update_on_change_command = "Telescope find_files", -- default: "e ."
                clearjumps_on_change = true,                       -- default: true
                autopush = false,                                  -- default: false
            }
            require("git-worktree").setup(opt)
            require("telescope").load_extension("git_worktree")
        end,
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        }
    },
    { -- diff / merge
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = { "DiffviewFileHistory", "DiffviewOpen" },
        config = function()              -- needs config, for access to diffview.actions in mappings
            require("diffview").setup {
                enhanced_diff_hl = true, -- true = no red for deletes
                show_help_hints = false,
                file_history_panel = {
                    win_config = { height = 5 },
                },
                hooks = {
                    diff_buf_read = function()
                        -- set buffername, mostly for tabline (lualine)
                        pcall(function() vim.api.nvim_buf_set_name(0, "Diffview") end)
                    end,
                },
                view = {
                    default = {
                        layout = "diff2_horizontal",
                        winbar_info = true,
                    },
                },
            }
        end,
    },
    "cdelledonne/vim-cmake",
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        config = function()
            require('refactoring').setup()
            require("telescope").load_extension("refactoring")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require 'luasnip'.filetype_extend("c")
            require 'luasnip'.filetype_extend("cpp")
            require 'luasnip'.filetype_extend("lua")
        end
    },
    {
        "tpope/vim-surround",
        dependencies = { "tpope/vim-repeat" },
        -- cs{exting}{new} - change surrounding
        -- ds{exting} - delete surrounding
        -- ys{motion}{exting} - add surrounding
        -- yS{exting}{new} - add surrounding on line
        -- yss{exting} - add surrounding on line
        --
    }
}

vim.cmd(
    [[
        let g:cmake_root_markers = ['CMakeLists.txt', 'build', 'cmake-build']
        let g:cmake_link_compile_commands = 1
        let g:cmake_build_dir_location = 'COMPILE_COMMANDS_HERE'
        let g:cmake_build_options= ["-j12"]
        let g:cmake_generate_options = ["-G Ninja"]
    ]])

table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        local ok, cmp = pcall(require, "copilot_cmp")
        if ok then cmp.setup({}) end
    end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
end

local Worktree = require("git-worktree")

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
    if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    end
end)
