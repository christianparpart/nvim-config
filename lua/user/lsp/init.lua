-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--     return
-- end
-- require("user.lsp.lsp-installer")

local mason_ok, mason = pcall(require, "mason")
if mason_ok then
    mason.setup()
end
-- require("mason").setup()

local lspconfig = require('lspconfig')
local lspHandlers = require("user.lsp.handlers")
lspHandlers.setup()
lspconfig.pyright.setup {
    on_attach = lspHandlers.on_attach,
    capabilities = lspHandlers.capabilities,
}
lspconfig.lua_ls.setup {
    on_attach = lspHandlers.on_attach,
    capabilities = lspHandlers.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            }
        }
    }
}

local HOME = vim.fn.expand("$HOME")
-- local contour_yml_schema_path = HOME ..  "/projects/contour/docs/contour.schema.json"

lspconfig.yamlls.setup {
    on_attach = lspHandlers.on_attach,
    capabilities = lspHandlers.capabilities,
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            },
            schemas = {
                -- [contour_yml_schema_path] = {"contour.yml"},
            }
        }
    },
}

lspconfig.clangd.setup {
    on_attach = lspHandlers.on_attach,
    capabilities = lspHandlers.capabilities,
    settings = {
        clangd = {
            cmd = { "/usr/bin/clangd", "--clang-tidy" },
            checkUpdates = true,
            fallbackFlags = { "-std=c++17", "-Wall", "-Werror" },
            -- trace = "/tmp/clangd.trace.log",
        },
    },
}

vim.cmd [[
    augroup my_lsp
        autocmd!
        nnoremap <A-o> :ClangdSwitchSourceHeader<CR>
        nnoremap ø     :ClangdSwitchSourceHeader<CR>
        nnoremap <silent> ga  <cmd>lua vim.lsp.buf.code_action()<CR>
    augroup end
]]

-- {{{ jsonls
local default_schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
    default_schemas = jsonls_settings.get_default_schemas()
end
local schemas = {
    {
        description = "TypeScript compiler configuration file",
        fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
        },
        url = "https://json.schemastore.org/tsconfig.json",
    },
    {
        description = "Babel configuration",
        fileMatch = {
            ".babelrc.json",
            ".babelrc",
            "babel.config.json",
        },
        url = "https://json.schemastore.org/babelrc.json",
    },
    {
        description = "ESLint config",
        fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
        },
        url = "https://json.schemastore.org/eslintrc.json",
    },
    {
        description = "Bucklescript config",
        fileMatch = { "bsconfig.json" },
        url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
    },
    {
        description = "Prettier config",
        fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
        },
        url = "https://json.schemastore.org/prettierrc",
    },
    {
        description = "Vercel Now config",
        fileMatch = { "now.json" },
        url = "https://json.schemastore.org/now",
    },
    {
        description = "Stylelint config",
        fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json",
        },
        url = "https://json.schemastore.org/stylelintrc",
    },
    {
        description = "A JSON schema for the ASP.NET LaunchSettings.json files",
        fileMatch = { "launchsettings.json" },
        url = "https://json.schemastore.org/launchsettings.json",
    },
    {
        description = "LLVM compilation database",
        fileMatch = {
            "compile_commands.json",
        },
        url = "https://json.schemastore.org/compile-commands.json",
    },
    {
        description = "Config file for Command Task Runner",
        fileMatch = {
            "commands.json",
        },
        url = "https://json.schemastore.org/commands.json",
    },
    {
        description = "Json schema for properties json file for a GitHub Workflow template",
        fileMatch = {
            ".github/workflow-templates/**.properties.json",
        },
        url = "https://json.schemastore.org/github-workflow-template-properties.json",
    },
    {
        description = "Packer template JSON configuration",
        fileMatch = {
            "packer.json",
        },
        url = "https://json.schemastore.org/packer.json",
    },
    {
        description = "NPM configuration file",
        fileMatch = {
            "package.json",
        },
        url = "https://json.schemastore.org/package.json",
    },
    {
        description = "JSON schema for Visual Studio component configuration files",
        fileMatch = {
            "*.vsconfig",
        },
        url = "https://json.schemastore.org/vsconfig.json",
    },
    {
        description = "Resume json",
        fileMatch = { "resume.json" },
        url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
    },
}

local function extend(tab1, tab2)
    if tab2 then
        for _, value in ipairs(tab2) do
            table.insert(tab1, value)
        end
    end
    return tab1
end

local extended_schemas = extend(schemas, default_schemas)
lspconfig.jsonls.setup {
    on_attach = lspHandlers.on_attach,
    capabilities = lspHandlers.capabilities,
    settings = {
        json = {
            schemas = extended_schemas,
        },
    },
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
            end,
        },
    },
}
-- }}}
