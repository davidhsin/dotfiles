" http://wiki.csie.ncku.edu.tw/vim/vimrc
" 教學


" 顯示行號
set number 
		
" 右下角顯示游標所在的行號與行數 set ruler

" 啟動語法高亮 
syntax on

" default file encoding 
set encoding=utf-8

" Line wrap.  超出螢幕寬度自動換行
set wrap

" Mouse support
set mouse=a

" 執行一些命令時，Vim 會迅速覆蓋之前的訊息，以便不阻礙視線
set shortmess+=c

" 在行號左側顯示符號欄位，用來顯示錯誤與警告
set signcolumn=yes


" 如同vscode中的ctrl + y.  
nnoremap r <Cmd>redo<CR>

" ;q = :q 
noremap <silent> ;q :q<CR>

" ;w = ;w：ㄨ
nnoremap <silent> ;w :update<CR>

" language-specific formatters
au FileType cpp set formatprg=clang-format | set equalprg=clang-format
						
" disable backup files
set nobackup
set nowritebackup
set noswapfile

set tabstop=4
" 自動縮排對齊間隔數：向右或向左一個縮排的寬度
set shiftwidth=4

" tab or shift tab 
" 在Normal模式下，數字+Tab可以多行移動
nnoremap <S-Tab> <<
nnoremap <Tab> >> 
vnoremap <S-Tab> <

" 只有這行無效！！
vnoremap <Tab> >  

" Shift + tab for insert mode
inoremap <S-Tab> <C-d>

" ?
nnoremap <c-z> <nop>

" Alt + 移動當前行向上 可改成 <M-UP> 
" nnoremap <M-UP> :move-<CR>==      
" vnoremap <M-UP> :move '<-2<CR>gv=gv

" Alt(Mac是option鍵) + 下箭頭移動當前行向下
" nnoremap <M-Down> :move+<CR>==
" nnoremap <D-Down> :move+<CR>==

" vnoremap <M-Down> :move '>+1<CR>gv=gv



" fzf 設定教學官方文件:  https://github.com/junegunn/fzf/blob/master/README-VIM.md

" 確保了在使用Vim時，能夠使用 fzf 相關的功能和插件告訴Vim 將指定路徑 /opt/homebrew/opt/fzf 加入到
" 'runtimepath'（運行時路徑）選項中。這樣做的目的是告訴Vim 在搜索插件、腳本和其他運行時文件時，也
" 應該搜索這個路徑。
set rtp+=/opt/homebrew/opt/fzf

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598


" Map insert mode CTRL-{hjkl} to arrows
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" 將//映射為取消搜索高亮的快捷鍵
nnoremap // :noh<CR>


"===============================

" C-p: FZF find files
" 按下 Ctrl+p 時，它將執行 :Files 命令
" nnoremap <silent> <C-p> :Files<CR>

" C-g: FZF ('g'rep)/find in files
" nnoremap <silent> <C-g> :Rg<CR>

"===============================
" <leader>p: find and replace with nvim-spectr
nnoremap <silent> <leader>l :lua require('spectre').open()<CR>

" <leader>fr: find and replace in current file
nnoremap <silent> <leader>g viw:lua require('spectre').open_file_search()<CR>

" (1) nnoremap：這是一個鍵映射的命令，它告訴 Vim 在 Normal 模式下（n 表示 Normal），
"               創建一個不遞歸（nore 表示 non-recursive）的按鍵映射。
"               不遞歸的映射意味著該按鍵映射不會被其他按鍵映射再次觸發。

" (2) <silent>：這個參數讓這個按鍵映射在執行時不會在命令行上顯示相應的命令。
"               也就是說，這個按鍵映射的操作是 "silent"（靜默的）。
"
" (3) <leader>l：這是按鍵序列，它的意思是按下 <leader> 鍵（通常是逗號 ,）後，
"                再按下小寫字母 l。這個按鍵序列觸發這個映射。
"
" (4) :lua require('spectre').open()<CR>：
"     這是要執行的操作。在這個映射中，它執行一個 Lua 函式，
"     這個函式是 require('spectre').open()。<CR> 表示按下 Enter 鍵，用於確定這個命令。
"     require('spectre').open()：這是一個 Lua 命令，它使用 Lua 的 require 函式來引入名
"     為 "spectre" 的模組（可能是一個插件或程式庫），並調用其 open 函式。






" <leader>s: symbols outline
nnoremap <silent> <leader>s :SymbolsOutline<CR>

" Only apply in when Makefile exists. 
au FileType c nnoremap <silent> ;k :VimuxRunCommand "make"<CR>
au FileType cpp nnoremap <silent> ;k :VimuxRunCommand "make"<CR>
" au FileType c nnoremap <silent> ;k :VimuxRunCommand("make ")<CR>


" 使用vimux一鍵執行c、cpp、python。注意"gcc " 一定要有空格

au Filetype c nnoremap <silent> ;r :VimuxRunCommand("clang " . bufname("%") . " && ./a.out")<CR>
au Filetype cpp nnoremap <silent> ;r :VimuxRunCommand("clang++ " . bufname("%") . " && ./a.out")<CR>
au Filetype python nnoremap <silent> ;r :VimuxRunCommand("python3 " . bufname("%"))<CR>

" ;m = make <filename> && ./<filename> 
" %  意思是檔名 
" :r 修飾檔名。假設是main.c則會變成main
" -s, --silent, --quiet       Don't echo commands.
" In command mode we should use :echo expand("%:t:r")
au FileType c nnoremap <silent> ;m :VimuxRunCommand("make " . expand("%:r") . " && ./" . expand("%:r"))<CR>
au FileType c nnoremap <silent> ;m :VimuxRunCommand("make -s " . expand("%:r") . " && ./" . expand("%:r"))<CR>


let g:lion_squeeze_spaces = 1

" Python
" 要設定，否則會出現錯誤：E319: No "python3" provider found. Run ":checkhealth provider"
let g:python3_host_prog = '/usr/bin/python3'
" pip3 install pynvim

" automatically read on change 告诉Vim在文件发生外部更改时自动重新读取文件
set autoread

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Highlight search results
set hlsearch
set incsearch

set t_Co=256

" no folds, ever
set foldlevelstart=99

" rainbow parens
let g:rainbow_active = 1

" Vim 不再受到 Vi 的严格兼容性限制，
" 可以使用 Vim 的所有现代功能和改进。这包括语法高亮
" 、多级撤销、括号匹配、分屏等功能。
set nocompatible

" 設定.txt檔有一個colorcolumn
au FileType text set colorcolumn=80

" colorcolumn 80 when opening C/C++
autocmd BufRead,BufNewFile *.c setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.h setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.cpp setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.hpp setlocal colorcolumn=80
" autocmd BufRead,BufNewFile *.c SetTab 4
" autocmd BufRead,BufNewFile *.h SetTab 4
" autocmd BufRead,BufNewFile *.cpp SetTab 4
" autocmd BufRead,BufNewFile *.hpp SetTab 4

" C/C++ indent options: fix extra indentation on function continuation
" set cino=(0,W4

" 要手動判定.h的文件類型是c
" autocmd BufRead,BufNewFile *.h set filetype=c

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

" faster updates!
set updatetime=100

" show syntax group of symbol under cursor.  用法> :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" colorscheme vim
" set notermguicolors
