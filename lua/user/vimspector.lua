
vim.cmd [[
  augroup my_vimspector
    autocmd!

    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
    let g:vimspector_enable_mappings = 'HUMAN'
    "let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    nmap <silent> <Leader>dR :VimspectorReset<cr>
    nmap <silent> <Leader>dp <Plug>VimspectorPause
    nmap <silent> <Leader>dc <Plug>VimspectorContinue
    nmap <silent> <Leader>dr <Plug>VimspectorRestart
    nmap <silent> <Leader>dt <Plug>VimspectorRunToCursor
    " Evaluate expression under cursor (or visual) in popup
    nmap <silent> <Leader>de <Plug>VimspectorBalloonEval
    nmap <silent> <Leader>dT :call vimspector#ClearBreakpoints()<cr>
  augroup end
]]

