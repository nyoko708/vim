"
" Vimの設定ファイル
"
" @desc
" プラグインの管理は、NeoBundle
" デフォルトのカラースキームはmolokai
" ショートカットコマンドも作っておく

" ### ショートカットコマンド ###
nnoremap <S-N><S-T> :NERDTree<CR>
nnoremap <S-C><S-S> :Unite colorscheme -auto-preview<CR>

" ### NeoBundleの設定 ###
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))

  " NeoBundleで管理しているプラグイン
  NeoBundleFetch 'Shougo/neobundle.vim'

  " NeoBundleで管理しているプラグイン
  NeoBundle 'scrooloose/nerdtree' " ツリー表示
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'Shougo/neomru.vim'

  " http://blog.remora.cx/2010/12/vim-ref-with-unite.html
  """"""""""""""""""""""""""""""
  " " Unit.vimの設定
  """"""""""""""""""""""""""""""
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " バッファ一覧
  noremap <S-P> :Unite buffer<CR>
  " ファイル一覧
  noremap <S-N> :Unite -buffer-name=file file<CR>
  " 最近使ったファイルの一覧
  noremap <S-Z> :Unite file_mru<CR>
  " sourcesを「今開いているファイルのディレクトリ」とする
  noremap :uff :<S-U>UniteWithBufferDir file -buffer-name=file<CR>
  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <S-D> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <S-D> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <S-V> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <S-V> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  """"""""""""""""""""""""""""""

  " Color Scheme
  NeoBundle 'tomasr/molokai'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'croaker/mustang-vim'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'modess/vim-phpcolors'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  " NeoBundle 'rhysd/vim-color-splatoon'

  call neobundle#end()

  " ### molokaiのテーマを使用する ###
  syntax on
  colorscheme molokai
  set t_Co=256

endif

filetype plugin indent on
" ### NeoBundleの設定ここまで ###


" 表示設定
set title "編集中のファイル名を表示
"set number         " 行番号を表示する
"qG
"set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set showmatch      " 対応する括弧を強調表示
"set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,


" Tab/Indent の設定
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 検索設定
set hlsearch "検索文字列をハイライトする
"set incsearch "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
"set gdefault "置換の時 g オプションをデフォルトで有効にする


" ステータスライン
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
