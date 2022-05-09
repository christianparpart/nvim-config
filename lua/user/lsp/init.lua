-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--     return
-- end

-- require("user.lsp.lsp-installer")
-- require("user.lsp.handlers").setup()

local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	settings = {
		clangd = {
            cmd = "/usr/bin/clangd-11",
            -- arguments = ["--clang-tidy"],
            checkUpdates = true,
            -- fallbackFlags = ["-std=c++17", "-Wall", "-Werror"],
            -- trace = "/tmp/clangd.trace.log",
		},
	},
}
