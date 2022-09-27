-- local colorscheme = "onedark"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

vim.cmd [[
    set background=dark                     " required to ensure it's using the dark theme
    let g:onedark_terminal_italics = 1
    let g:onedark_hide_endofbuffer = 1
    colorscheme onedark

    hi Search gui=bold guifg=yellow

    hi link LspComment Comment

    hi LspReferenceText  gui=none guibg=#4040A0 guifg=#C0C0C0 ctermbg=237
    hi LspReferenceRead  gui=bold guibg=#40A040 guifg=#FFFFFF ctermbg=237
    hi LspReferenceWrite gui=bold guibg=#A04040 guifg=#FFFFFF ctermbg=237

    hi DiagnosticUnderline gui=undercurl guisp=red
    hi DiagnosticUnderlineError gui=undercurl guisp=red
    hi DiagnosticUnderlineHint gui=undercurl guisp=yellow
    hi DiagnosticUnderlineInfo gui=undercurl guisp=blue
    hi DiagnosticUnderlineInformation gui=undercurl guisp=green
    hi DiagnosticUnderlineWarning gui=undercurl guisp=yellow

    hi DiagnosticVirtualTextHint guifg=gray

    " TODO: port over remaining (Comment, Diagnostics...) to coc.nvim hilight groups (see `:h coc-highlight`)
    hi link CocHighlightText  LspReferenceText
    hi link CocHighlightRead  LspReferenceRead
    hi link CocHighlightWrite LspReferenceWrite

    hi CocInlayHint guifg=#9d8f5e gui=italic

]]

-- vim.cmd [[ autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.buf.semantic_tokens_full() ]]
