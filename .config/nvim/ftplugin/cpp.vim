setlocal sw=2 sts=2 ts=2 et
inoremap << <<

function! CPPCodeCleanup()
  :silent !clang-format -i %
endfunction
command! CPPCodeCleanup call CPPCodeCleanup()
