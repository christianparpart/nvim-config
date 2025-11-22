local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Recommended for completion

lspconfig.clangd.setup({
  -- ... (on_attach and capabilities remain the same)
  capabilities = capabilities,

  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",

    -- **Crucial C++ Settings for Modern Code**
    -- Include flags to tell clangd what C++ standard and warnings to use.
    -- This is a fallback and generally less flexible than using compile_commands.json (see Step 3)
    -- "--compile-commands-dir=build", -- Uncomment if using a custom build directory
    -- "--query-driver=/usr/bin/gcc,/usr/bin/g++", -- Example for non-default compiler paths
  },

  -- Recommended way to tell clangd where your project root is
  root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "build", "out"),
})
