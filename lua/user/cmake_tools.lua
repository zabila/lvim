local status_ok, cmake_tools = pcall(require, "cmake-tools")
if not status_ok then
    print("‼ Tried loading cmake-tools ... unsuccessfully.")
    return
end

cmake_tools.setup {
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_console_size = 10,
    cmake_show_console = "always",
    cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 },
    },
}
