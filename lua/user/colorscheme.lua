-- local colorscheme = "onedark"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

vim.cmd [[
    try
        colorscheme darkplus
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry

    hi Search gui=bold guifg=yellow

    hi LspReferenceText  gui=none guibg=#4040A0 guifg=#C0C0C0 ctermbg=237
    hi LspReferenceRead  gui=bold guibg=#40A040 guifg=#FFFFFF ctermbg=237
    hi LspReferenceWrite gui=bold guibg=#A04040 guifg=#FFFFFF ctermbg=237
]]

