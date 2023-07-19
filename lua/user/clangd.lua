lvim.format_on_save = true
vim.diagnostic.config({ virtual_text = true })

lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }

table.insert(lvim.plugins, {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

local clangd_flags = {

    "--fallback-style=google",
    "-j=12",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--ranking-model=heuristics",

    "--background-index",
    "--fallback-style=Google",
    "--all-scopes-completion",
    "--clang-tidy",
    "--log=error",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pch-storage=memory",     -- could also be disk
    "--folding-ranges",
    "--enable-config",          -- clangd 11+ supports reading from .clangd configuration file
    "--offset-encoding=utf-16", --temporary fix for null-ls
    "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
}

local provider = "clangd"
local custom_on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
    clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
    require("lvim.lsp").common_on_init(client, bufnr)
    require("clangd_extensions.config").setup {}
    require("clangd_extensions.ast").init()
    vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local cmake_status, cmake = pcall(require, "cmake-tools")
if not cmake_status then
    print("cmake-tools not found")
    return
end

local opts = {
    cmd = { provider, unpack(clangd_flags) },
    on_attach = custom_on_attach,
    on_init = custom_on_init,
    on_new_config = function(new_config, _)
        cmake.clangd_on_new_config(new_config)
    end,
}

require("lvim.lsp.manager").setup("clangd", opts)


local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
    print "dap not found"
    return
end

dap.adapters.codelldb  = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
        args = { "--port", "${port}" },
        detached = false,
    }

    -- attach = {
    --     pidProperty = "processId",
    --     pidSelect = "ask",
    -- },
}

-- this configuration should start cpptools and the debug the executable main in the current directory when executing :DapContinue
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = true,
        console = "externalTerminal",
    },
}

dap.configurations.c   = dap.configurations.cpp
