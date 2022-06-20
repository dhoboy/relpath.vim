" project path: the directory where you opened vim
function! setProjectPath
  exe "normal! lcd " . @p
endfunction

" relative path: the directory of the currently opened file
function setRelativePath
  exe "normal! lcd " . %:h
endfunction

