local status_ok, hlargs = pcall(require, "hlargs")
if not status_ok then
    return
end

hlargs.setup {
    disable = function(_, bufnr)
        if vim.b.semantic_tokens then
            return true
        end
        local clients = vim.lsp.get_active_clients { bufnr = bufnr }
        for _, c in pairs(clients) do
            local caps = c.server_capabilities
            if c.name ~= "null-ls" and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
                vim.b.semantic_tokens = true
                return vim.b.semantic_tokens
            end
        end
    end,
}
