local status_ok, godbolt = pcall(require, "godbolt")
if not status_ok then
    return
end

godbolt.setup({
    languages = {
        c = { compiler = "cg122", options = {} },
        cpp = { compiler = "g122", options = {} },
        rust = { compiler = "r1600", options = {} },
        -- any_additional_filetype = { compiler = ..., options = ... },
    },
    quickfix = {
        enable = true, -- whether to populate the quickfix list in case of errors
        auto_open = true -- whether to open the quickfix list in case of errors
    },
    url = "https://godbolt.org" -- can be changed to a different godbolt instance
})
