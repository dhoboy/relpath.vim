" save the project path when vim opens
autocmd VimEnter * let @p = expand('%:p:h')

" keybinding to set relative path change directory to current file
" (so your relative file import works)
nnoremap <leader>rp :call fn#SetRelativePath()<cr>

" keybinding to re-set project path as path for current file
" (so your fuzzy finder works across entire project)
nnoremap <leader>pp :call fn#SetProjectPath()<cr>

