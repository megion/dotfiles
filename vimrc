" An example for a vimrc file.

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  " Also switch on highlighting the last used search pattern.
  set hlsearch

  " I like highlighting strings inside C comments.
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" My customization
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'morhetz/gruvbox' " gruvbox colorscheme
"Plugin 'octol/vim-cpp-enhanced-highlight' " cpp syntax enhanced
"Plugin 'taglist.vim' " ctags
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-project-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/xml.vim'
"Plugin 'ternjs/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" tells eclim to register its completion to vim's omni complete which
" YouCompleteMe will automatically detect
let g:EclimCompletionMethod = 'omnifunc'

syntax enable

set background=dark    " Setting dark mode
"colorscheme gruvbox
colorscheme solarized "gruvbox 
call togglebg#map("<F9>")
set colorcolumn=120
"highlight ColorColumn ctermbg=darkgray
let g:ackhighlight = 1
au FileType qf setlocal colorcolumn= " set nocolorcolumn in quickfix window

" open new tab
nnoremap <F4> :tabnew<CR>

" open nerdtree
nnoremap <F3> :NERDTreeToggle<CR>

" search current word
noremap <Leader>a :Ack <cword><cr>
" eclim java search 
"noremap <Leader>b :JavaSearchContext<cr>

" toggle highlight search
nnoremap <F2> :set hlsearch!<CR>

" reload all buffers
nnoremap <F12> :checktime<CR>

nnoremap <F5> :make!<CR>

nnoremap <leader>z :YcmCompleter GoTo<CR>
nnoremap <leader>t :vertical resize +10<CR>
nnoremap <leader>g :vertical resize -10<CR>
nnoremap <F7> :UndotreeToggle<CR>

nnoremap <F6> :Autoformat<CR>
vnoremap <F6> :Autoformat<CR>
let g:autoformat_verbosemode=1
let g:formatdef_html_custom='"html-beautify -w 40"'
let g:formatters_html = ['html_custom']
"nnoremap <leader>gq :%!html-beautify -w 40<CR>
vnoremap <leader>gq :!html-beautify -w 40<CR>

set autoread

" fugitive git plugin
" delete fugitive buffer automatical
autocmd BufReadPost fugitive://* set bufhidden=delete

" Read additional .vimrc file in current directory
set exrc
set secure

" vimdiff - hide break lines diff
set diffopt+=iwhite
set diffexpr=""

" use only for vim-X11
set clipboard=unnamedplus

" code fold
let g:javascript_plugin_flow = 1
set foldmethod=syntax
set foldlevelstart=20
"set foldlevelstart=0
"let javaScript_fold=1
let c_no_comment_fold = 1

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=indent

set ignorecase
"set smartcase
"set smartindent
"set autoindent
set number
set tabstop=4 " count of space which show tab
set softtabstop=4 " count of space which show tab when it added
set shiftwidth=4 " count of space add by commands '>>' and '<<'
set expandtab


" copies just the filename to the clipboard
nmap ,cs :let @+=expand("%")<CR>
" copies the filename including its full path to the clipboard
nmap ,cl :let @+=expand("%:p")<CR>

