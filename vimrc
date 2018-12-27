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
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'vim-scripts/XML-Folding'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" tells eclim to register its completion to vim's omni complete which
" YouCompleteMe will automatically detect
let g:EclimCompletionMethod = 'omnifunc'

" disable Syntastic Java diagnostics - YouCompleteMe Java Semantic Completion
let g:syntastic_java_checkers = []
" disable ycm completer for java and scala
let g:ycm_filetype_blacklist = {
        \ 'java' : 1,
        \ 'scala' : 1
        \}
" enable all files for ycm
"let g:ycm_filetype_blacklist = {}

syntax enable

set background=dark    " Setting dark mode
"colorscheme gruvbox
" for mintty-colors-solarized
let g:solarized_termtrans=1
colorscheme solarized "gruvbox 
"let g:solarized_contrast = "high" 
 
call togglebg#map("<F9>")
set colorcolumn=120
"highlight ColorColumn ctermbg=darkgray
let g:ackhighlight = 1
au FileType qf setlocal colorcolumn= " set nocolorcolumn in quickfix window

" open new tab
nnoremap tn :tabnew<CR>

" open nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

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
"nnoremap <leader>z :YcmCompleter GoToDefi<CR>
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

