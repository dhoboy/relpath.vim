" relative path -> the directory of the currently opened file
function fn#SetRelativePath()
  let relativePath = expand("%:h")
  execute "lcd " . relativePath
endfunction

" project path -> the directory where you opened vim
function fn#SetProjectPath()
  let projectPath = @p
  execute "lcd " . projectPath
endfunction

