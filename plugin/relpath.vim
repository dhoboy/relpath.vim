" save the project path when vim opens
autocmd TermResponse * :let @p=@%

" relative path (change directory to current file)
nnoremap <leader>rp setRelativePath

" -- keybinding to re-set project path as path for current file
"    (so your fuzzy finder works)
nnoremap <leader>pp setProjectPath

