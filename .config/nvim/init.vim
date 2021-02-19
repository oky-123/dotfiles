" エンコード
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=single " □や○文字が崩れる問題を解決

" 行数
set number
set noswapfile
set clipboard+=unnamed
set mouse=a
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" 検索
set incsearch
set ignorecase
set smartcase
set wrapscan

" 外観
set ruler
set showmatch

" <Leader>
let mapleader = "\<space>"

inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

let g:coquille_auto_move = 'true'
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" python
let g:python3_host_prog = expand('~/nvim_python3/bin/python3')
let g:python_host_prog = expand('~/nvim_python2/bin/python2')

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  au BufRead,BufNewFile *.v set filetype=coq
  au BufRead,BufNewFile *.nim set filetype=nim
  au BufRead,BufNewFile *.md set filetype=mkd
  au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  au BufRead,BufNewFile *.jb set filetype=ruby
  au BufRead,BufNewFile *.{tsx,jsx} set filetype=typescript
  "sw=softtabstop, sts=shiftwidth    , ts=tabstop, et=expandtabの略
  autocmd FileType c               setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp             source ~/.config/nvim/ftplugin/cpp.vim
  autocmd FileType coq             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType java            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType rust            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType mkd             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go              setlocal sw=4 sts=4 ts=4
  autocmd FileType sql             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType nim             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
endif

set hidden
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

augroup MyAutoCmd
  autocmd!
augroup END

" 空白削除
autocmd BufWritePre * call s:remove_unnecessary_space()
function! s:remove_unnecessary_space()
   " delete last spaces
   %s/\s\+$//ge
   " delete last blank lines
   while getline('$') == "" && len(join(getline(0, '$')))
           $delete _
   endwhile
endfunction
