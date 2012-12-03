"----------------------------------------
" plugin - NeoBundle
"----------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.vim/.bundle/'))
endif

NeoBundle 'https://github.com/h1mesuke/unite-outline.git'
NeoBundle 'https://github.com/kana/vim-smartchr.git'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/mattn/zencoding-vim.git'
NeoBundle 'https://github.com/motemen/hatena-vim.git'
NeoBundle 'https://github.com/othree/eregexvim.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
" NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unitevim.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/ujihisa/shadowvim.git'
NeoBundle 'https://github.com/vim-scripts/delphi.vim.git'
NeoBundle 'https://github.com/vim-scripts/JSON.vim.git'
NeoBundle 'https://github.com/vim-scripts/TwitVim.git'
NeoBundle 'https://githubcom/Shougo/neocomplcache-clang_complete.git'
NeoBundle 'https://githubcom/Rip-Rip/clang_complete.git'
" perl 
NeoBundle 'petdance/vim-perl'
NeoBundle 'Shougo/neocomplcache-snippets-complete'

filetype plugin on
filetype indent on

" clang_complete
let g:clang_complete_auto=1
let g:clang_use_library=1
let g:clang_library_path='/usr/share/clang'
let g:clang_exec="/usr/bin/clang"
let g:clang_user_options='2>/dev/null || exit 0"'

" <TAB> completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" vim固有設定
set iskeyword+=:
set complete+=k~/.vim_extras/perl_module_list

autocmd FileType perl,cgi :compiler perl

"viとの互換性をとらない
set nocompatible
"バックアップをとらない
set nobackup
"新しい行のインデントを現在行と同じにする
set autoindent
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 改行コードの自動認識
set fileformats=unix,dos,mac
"ファイル内の <Tab> が対応する空白の数
set shiftwidth=4
"タブ1文字の幅を設定
set tabstop=4
"最後まで検索したら先頭に戻る
set wrapscan
"他で書き換えられたら自動で読み直す
set autoread
" オートコマンド
if has("autocmd")
	" ファイルタイプ別インデント、プラグインを有効にする
	filetype plugin indent on
	" カーソル位置を記憶する
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif
endif

" ビープ音を鳴らさない
set vb t_vb=

" perl,cgi設定
syntax on
au BufReadPost,BufNewFile *.t :setl filetype=perl
set cindent
" :make command
autocmd FileType perl,cgi map <F3> :w<CR> :make<CR>
" :w + !perl command
autocmd FileType perl,cgi map <F4> :w !perl<CR>
" !perl command
autocmd FileType perl,cgi map <F5> :!perl %<CR>
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'defult'	: ' ',
	\ 'perl'	: $HOME . '/.vim/dict/perl.dict'
	\ }

" python設定
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
