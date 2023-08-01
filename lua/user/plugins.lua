lvim.plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        'echasnovski/mini.bracketed',
        version = '*',
        config = function()
            require('mini.bracketed').setup()
        end,
    },
    {
        "HiPhish/nvim-ts-rainbow2",
    },
    { 'projekt0n/github-nvim-theme' },
    { "christoomey/vim-tmux-navigator" },
    "Shatur/neovim-session-manager",
    "ellisonleao/gruvbox.nvim",
    "lifepillar/vim-solarized8",
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
                change_directory_command = "cd",
                update_on_change = true,
                update_on_change_command = "Telescope find_files",
                clearjumps_on_change = true,
                autopush = false,
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
        config = function()
            require("diffview").setup {
                enhanced_diff_hl = true,
                show_help_hints = false,
                file_history_panel = {
                    win_config = { height = 5 },
                },
                hooks = {
                    diff_buf_read = function()
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
    "Civitasv/cmake-tools.nvim",
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
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup({
                mappings = {
                    add = 'sa',            -- Add surrounding in Normal and Visual modes
                    delete = 'sd',         -- Delete surrounding
                    find = 'sf',           -- Find surrounding (to the right)
                    find_left = 'sF',      -- Find surrounding (to the left)
                    highlight = 'sh',      -- Highlight surrounding
                    replace = 'sr',        -- Replace surrounding
                    update_n_lines = 'sn', -- Update `n_lines`

                    suffix_last = 'l',     -- Suffix to search with "prev" method
                    suffix_next = 'n',     -- Suffix to search with "next" method
                },
            })
        end
    },
    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
        end,
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
            require("telescope").load_extension("dap")
        end,
    },
    "theHamsta/nvim-dap-virtual-text",
    "tjdevries/colorbuddy.nvim",
    {
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require "telescope".load_extension("frecency")
        end,
        dependencies = { "kkharji/sqlite.lua" }
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 1,
                    width = 0.8,
                    options = {
                        signcolumn = "no",
                        number = true,
                        relativenumber = true,
                    },
                },
                plugins = {
                    gitsigns = { enabled = true },
                    tmux = { enabled = true },
                },
            }
        end,
    },
    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require("telescope").load_extension("smart_open")
        end,
        dependencies = {
            "kkharji/sqlite.lua",
            -- Only required if using match_algorithm fzf
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    }
}

vim.cmd(
    [[
        let g:cmake_root_markers = ['CMakeLists.txt', 'build', 'cmake-build', '.git']
        let g:cmake_link_compile_commands = 1
        let g:cmake_build_dir_location = 'COMPILE_COMMANDS_HERE'
        let g:cmake_build_options= ["-j12"]
        let g:cmake_generate_options = ["-G Ninja"]
    ]])

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    fix_pairs = true,
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        local ok, cmp = pcall(require, "copilot_cmp")
        if ok then
            cmp.setup({
                mapping = {
                    ["<Tab>"] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),
                },
            })
        end
    end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
end
