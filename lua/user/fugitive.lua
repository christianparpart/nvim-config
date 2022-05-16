-- vim-fugitive configuration
vim.cmd [[
    augroup my_fugitive_cfg
        au!
        nnoremap <leader>gs :Gstatus<CR>
        " nnoremap <leader>gc :Gcommit -v -q<CR>
        " nnoremap <leader>ga :Gcommit --amend<CR>
        " nnoremap <leader>gt :Gcommit -v -q %<CR>
        nnoremap <leader>gd :Gvdiffsplit<CR>
        nnoremap <Leader>gb :Git blame<CR>
        nnoremap <Leader>gl :Git log<CR>

        " In diff view to stage a chunk
        vnoremap <Leader>dp :diffput<CR>
        vnoremap <Leader>ga :diffput<CR>

        " nnoremap <leader>ge :Gedit<CR>
        " nnoremap <leader>gr :Gread<CR>
        " nnoremap <leader>gw :Gwrite<CR><CR>
        " nnoremap <leader>gl :silent! Glog<CR>
        " nnoremap <leader>gp :Ggrep<Space>
        " nnoremap <leader>gm :Gmove<Space>
        " nnoremap <leader>gb :Git branch<Space>
        " nnoremap <leader>go :Git checkout<Space>
        " nnoremap <leader>gps :Dispatch! git push<CR>
        " nnoremap <leader>gpl :Dispatch! git pull<CR>
    augroup end
]]

