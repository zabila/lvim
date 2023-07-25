lvim.keys.normal_mode["<Left>"] = ':choe "Use h"<CR>'
lvim.keys.normal_mode["<Right>"] = ':echoe "Use l"<CR>'
lvim.keys.normal_mode["<Up>"] = ':echoe "Use k"<CR>'
lvim.keys.normal_mode["<Down>"] = ':echoe "Use j"<CR>'

lvim.keys.normal_mode["<c-f>"] = ":NvimTreeFocus<CR>"

lvim.keys.insert_mode["jj"] = "<Esc>"

lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>Lspsaga lsp_finder<cr>", "Find" }
lvim.lsp.buffer_mappings.normal_mode["rn"] = { "<cmd>Lspsaga rename<cr>", "Rename" }
lvim.lsp.buffer_mappings.normal_mode["ca"] = { "<cmd>Lspsaga code_action<cr>", "Code action" }
lvim.lsp.buffer_mappings.normal_mode["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Documentation" }

local kind = require('user.kind')
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
    ":lua require'telescope.builtin'.lsp_references()<cr>",
    kind.cmp_kind.Reference .. " Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
    ":lua vim.lsp.buf.definition()<cr>",
    -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
    kind.cmp_kind.Reference .. " Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
    ":lua vim.lsp.buf.type_definition()<cr>",
    kind.cmp_kind.Reference .. " Type Definition"
}

local wk = lvim.builtin.which_key
wk.mappings["u"] = { require('undotree').toggle, "Undotree toggle" }
wk.mappings["m"] = {
    m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
    t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
    a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
    s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
    d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
    f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
    g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
    q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
    w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
    e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
    r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
    n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
    p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

wk.mappings["p"] = {
    name = ' Projects ',
    l = { ':Telescope projects<cr>', 'Projects' }, -- requires telescope-project.nvim plugin
    r = { ':Telescope resume<cr>', 'Resume' },
}
wk.mappings.g.d = { ":DiffviewOpen<cr>", "DiffView" }

wk.mappings.g.t = {
    name = "Worktree",
    l = { require("telescope").extensions.git_worktree.git_worktrees, "Telescope" },
    c = { require("telescope").extensions.git_worktree.create_git_worktree, "Create" },
}

wk.mappings.l.R = { ":LspRestart<cr>", kind.icons.exit .. " Restart" }
wk.mappings["t"] = {
    name = "+Terminal",
    f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
    v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

wk.mappings.f = { "<cmd>Telescope find_files<CR>", "Find file" }
wk.mappings["s"]["w"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer fuzzy find" }
wk.mappings["S"] = {
    name = " persistence.nvim",
    s = { "<cmd>lua require('persistence').load()<cr>", kind.icons.clock .. " Reload last session for dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", kind.icons.clock .. " Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", kind.icons.exit .. " Quit without saving session" },
}

wk.mappings["B"] = {
    name = "CMake",
    c = { "<cmd>CMakeGenerate<cr>", "Generate" },
    b = { "<cmd>CMakeBuild<cr>", "Build" },
    r = { "<cmd>CMakeRun<cr>", "Run" },
    S = { "<cmad>CMakeStop<cr>", "Stop" },
}

wk.mappings["W"] = {
    name = ' ' .. kind.icons.screen .. " Window Ctrl",
    h    = { "<C-w><C-h>", "Move to left window" },
    j    = { "<C-w><C-j>", "Move to below window" },
    k    = { "<C-w><C-k>", "Move to above window" },
    l    = { "<C-w><C-l>", "Move to right window" },
    w    = { "<C-w>w", "Move to other window" },
    x    = { "<C-w>x", "Swap with other window" },
    s    = { "<C-w>s", "Split window" },
    v    = { "<C-w>v", "Split window vertically" },
    c    = { "<C-w>q", "Close window" },
    o    = { "<C-w>o", "Keep only current window" },
    t    = { "<C-w>T", "Move window to a tab" },
    m    = {
        name = "+Max",
        W = { "<C-w>|", "Max out width" },
        H = { "<C-w>_", "Max out hight" }
    },
    r    = {
        name = "+Resize",
        l = { "<cmd>vertical resize +10<cr>", "Increase width" },
        k = { "<cmd>resize +10<cr>", "Increase height" },
        h = { "<cmd>vertical resize -10<cr>", "Decrease width" },
        j = { "<cmd>resize -10<cr>", "Decrease height" }
    },
    n    = { "<C-w>=", "Normalize Windows" }
}

vim.keymap.set(
    { "n", "x" },
    "<leader>rr",
    function() require('telescope').extensions.refactoring.refactors() end
)

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {})
