" ====== basic setup ====== 
syntax on
set number 
set encoding=utf-8

" Line wrap. 超出螢幕寬度自動換行
set wrap

" Mouse support
set mouse=a

" 執行一些命令時，Vim 會迅速覆蓋之前的訊息，以便不阻礙視線
set shortmess+=c

" 在行號左側顯示符號欄位，用來顯示錯誤與警告
set signcolumn=yes

" Highlight search results
set hlsearch
set incsearch

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" 自動縮排對齊間隔數：向右或向左一個縮排的寬度
set shiftwidth=4
set tabstop=4
set smartindent " 改善 } 格式跑掉測試。

set t_Co=256
set termguicolors  " Can switch to notermguicolors

" faster updates!
set updatetime=100

" vim 執行時不需考慮和 vi 相容。預設為開啟，所以不設定
" set nocompatible

" automatically read on change
set autoread

" no folds, ever
set foldlevelstart=99

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" copy and paste out of vim
vnoremap <silent> ;y "+y<CR>

" Use ctrl + y as in VSCode
nnoremap r <Cmd>redo<CR>

" ;q = :q 
noremap <silent> ;q :q<CR>

" ;w = :update
nnoremap <silent> ;w :update<CR>

" ;wq = :wq
nnoremap <silent> ;wq :update \| :q<CR>

" // = :noh
nnoremap // :noh<CR>

" ====== basic movement ======
" Map insert mode CTRL-{hjkl} to arrows
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" tab / Shift Tab。在Normal模式下，數字+Tab可以多行移動
nnoremap <S-Tab> <<
nnoremap <Tab> >> 
" Shift + tab for insert mode
inoremap <S-Tab> <C-d>
" Move single line Up or Down in Normal Mode
nnoremap <C-j> :move+<CR>==
nnoremap <C-k> :move-2<CR>==
" Move selected lines Up or Down in V-LINE (VISUAL) Mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" 右縮排並保持選中
vnoremap > >gv
" 左縮排並保持選中
vnoremap < <gv

" <leader>p: find and replace with nvim-spectr
nnoremap <silent> <leader>l :lua require('spectre').open()<CR>

" <leader>fr: find and replace in current file
nnoremap <silent> <leader>g viw:lua require('spectre').open_file_search()<CR>

" language-specific formatters
au FileType cpp set formatprg=clang-format | set equalprg=clang-format

" Only apply in when Makefile exists. 
au FileType c nnoremap <silent> ;k :VimuxRunCommand "make"<CR>
au FileType cpp nnoremap <silent> ;k :VimuxRunCommand "make"<CR>
" au FileType c nnoremap <silent> ;k :VimuxRunCommand("make ")<CR>

" 使用vimux一鍵執行c、cpp、python。注意"gcc " 一定要有空格
au Filetype c nnoremap <silent> ;r :VimuxRunCommand("clang " . bufname("%") . " && ./a.out")<CR>	" OJ 練完後取消註解
au Filetype cpp nnoremap <silent> ;r :VimuxRunCommand("clang++ " . bufname("%") . " && ./a.out")<CR>
au Filetype python nnoremap <silent> ;r :VimuxRunCommand("python3 " . bufname("%"))<CR>

" 為了暫時練 OJ 方便先設定為這樣，原設定在 107 行
"au Filetype c nnoremap <silent> ;r :VimuxRunCommand("clang " . bufname("%") . " && ./a.out < input.txt")<CR>

" ;m = make <filename> && ./<filename> 
" %  意思是檔名 
" :r 修飾檔名。假設是main.c則會變成main
" -s, --silent, --quiet       Don't echo commands.
" In command mode we should use :echo expand("%:t:r")
au FileType c nnoremap <silent> ;m :VimuxRunCommand("make " . expand("%:r") . " && ./" . expand("%:r"))<CR>
au FileType c nnoremap <silent> ;m :VimuxRunCommand("make -s " . expand("%:r") . " && ./" . expand("%:r"))<CR>

let g:python3_host_prog = '/usr/bin/python3'

" 等號對齊: glip=
" 行首對齊: glip + Enter
let g:lion_squeeze_spaces = 1


" rainbow parens
let g:rainbow_active = 1

" 設定.txt檔有一個colorcolumn
au FileType text set colorcolumn=80

" colorcolumn 80 when opening C/C++ or py
autocmd BufRead,BufNewFile *.c setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.hpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.py setlocal colorcolumn=80

" 要手動判定.h的文件類型是c
autocmd BufRead,BufNewFile *.h set filetype=c

" 將 .S file 的註解改為 #：
autocmd FileType asm let b:commentary_format = '# %s'

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case-insensitive feature
let g:EasyMotion_startofline = 1

nmap .s <Plug>(easymotion-overwin-f)
nmap .d <Plug>(easymotion-overwin-f2)
nmap .g <Plug>(easymotion-overwin-w)
nmap .t <Plug>(easymotion-tl)    
nmap .f <Plug>(easymotion-fl)  
" Line motion above current line
nmap .j <Plug>(easymotion-j)    
nmap .k <Plug>(easymotion-k)    
nmap ./ <Plug>(easymotion-overwin-line)
nmap .a <Plug>(easymotion-jumptoanywhere)

" show syntax group of symbol under cursor.  
" 用法 :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
