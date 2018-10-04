setlocal sw=4 sts=4 ts=4 et
inoremap << <<

function! CPPCodeCleanup()
  :silent !clang-format -i %
endfunction
command! CPPCodeCleanup call CPPCodeCleanup()
