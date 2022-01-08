" エンコード
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=single " □や○文字が崩れる問題を解決
set signcolumn=yes:3
set updatetime=100

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

" Scroll Out
set so=999

" <Leader>
let mapleader = "\<space>"

inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" fzf
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>e :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>r :Rg<CR>
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }

let g:coquille_auto_move = 'true'
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" python extension
let g:python3_host_prog = expand('/opt/homebrew/bin/python3')
let g:python_host_prog = expand('/usr/bin/python')

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
  au BufRead,BufNewFile *.kt set filetype=kotlin
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
  autocmd FileType toml            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType mkd             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go              setlocal sw=4 sts=4 ts=4
  autocmd FileType sql             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType nim             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType kotlin          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim             setlocal sw=4 sts=4 ts=4 et
endif

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePre * set ft=xxd | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

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

  " fzf
  call dein#add('lotabout/skim', { 'dir': '~/.skim', 'do': './install' })
  call dein#add('lotabout/skim.vim')

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

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

" vimscriptを再ロードする
nnoremap <Leader>. :source ~/.config/nvim/init.vim<CR>


" ************************************************
" * ファイルごとのマークリストを取得する
" ************************************************
let s:signs_to_show = "abcdefghijklmnopqrstuvwxyz.'<>^ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let s:sign_text_hl = 'Label'
let s:refresh_signs_on_cursor_hold = 1

" Define signs used in ShowMarks
function! s:define_signs()
    " White list letters
    let sign_list = []
    for i in range(len(s:signs_to_show))
        call add(sign_list, { "name": "ShowMarks_" . s:signs_to_show[i] . "_txt",
            \ "text": s:signs_to_show[i],
            \ "texthl": s:sign_text_hl })
    endfor

    " Define signs
    call sign_define(sign_list)
endfunction
call s:define_signs()

" Refresh the display of signs
function! s:refresh_signs()
    " Get current buffer
    let current_buf = bufnr('%')

    " Clear Signs
    call sign_unplace('ShowMarks')

    " Dict for placed sign
    let lnum_sign_placed = {}

    " Get global marks (high priority)
    let global_mark_list = getmarklist()
    " Get local marks (low priority)
    let local_mark_list = getmarklist(current_buf)

    call s:place_sign_from_existing_marks(current_buf, global_mark_list + local_mark_list, lnum_sign_placed)
endfunction

function! PrintMarkList()
    let current_buf = bufnr('%')
    let global_mark_list = getmarklist()
    echo "global_mark_list: "
    for m in global_mark_list
        echo m
    endfor

    let local_mark_list = getmarklist(current_buf)
    echo "local_mark_list: "
    for m in local_mark_list
        echo m
    endfor
endfunction

" Place signs (Only marks defined in s:signs_to_show)
function! s:place_sign_from_existing_marks(current_buf, mark_list, lnum_sign_placed)
    " Set priority
    let priority = 0

    for m in a:mark_list
        let mark = m['mark'][1]
        let lnum = m['pos'][1]

        " Check if the mark is included in the white lists
        if matchstr(escape(s:signs_to_show, '.'), escape(mark, '.')) == ''
            continue
        endif

        " If no sign has placed at the lnum, place the sign
        if !has_key(a:lnum_sign_placed, lnum)
            call sign_place(0, 'ShowMarks', 'ShowMarks_' . mark . '_txt', a:current_buf, {'lnum' : lnum, 'priority': priority})
            let a:lnum_sign_placed[lnum] = 1
        endif
    endfor

endfunction

"
autocmd CursorHold * if (s:refresh_signs_on_cursor_hold ) | call s:refresh_signs() | endif
