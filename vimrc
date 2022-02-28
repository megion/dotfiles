" My customization
set nocompatible              " be iMproved, required
filetype off                  " required


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Add plugins here
"Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'ryanoasis/vim-devicons'
"Plug 'scrooloose/nerdtree-project-plugin'

" solarized theme
Plug 'altercation/vim-colors-solarized'
Plug 'overcache/NeoSolarized'

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/vcscommand.vim'
Plug 'othree/html5.vim'
Plug 'editorconfig/editorconfig-vim'

"to highlight tsx
Plug 'HerringtonDarkholme/yats.vim'
" highlight js
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" improve highlight cxx
Plug 'jackguo380/vim-lsp-cxx-highlight'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" coc.nvim
" dnf install ruby-devel
" run :CocInstall coc-json coc-tsserver coc-html coc-css coc-java
" coc-solargraph coc-eslint coc-angular coc-clangd
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
"Plug 'vhdirk/vim-cmake'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" add debug support
Plug 'puremourning/vimspector'

" vim fold
Plug 'pseewald/vim-anyfold'

"Plug 'tpope/vim-obsession'
"Plug 'dhruvasagar/vim-prosession'

"Plug 'eslint/eslint'
"
" jsx commentary support
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'vim-syntastic/syntastic'

Plug 'mhinz/vim-grepper'

Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()

set encoding=utf-8
"set guifont=SourceCodePro\ Nerd\ Font\ 10

" see nerdcommenter 
filetype plugin on

"syntax enable
filetype plugin indent on " required
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
"autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype

"set foldlevel=0  " close all folds
" or
set foldlevel=99 " Open all folds

" open new tab
nnoremap tn :tabnew<CR>

" open nerdtree
nnoremap tt :NERDTreeToggle<CR>

" find file in tree
nnoremap tf :NERDTreeFind<CR>

" search current word
" noremap <Leader>a :Ack <cword><cr>
" eclim java search
"noremap <Leader>b :JavaSearchContext<cr>

" reload all buffers
nnoremap ct :checktime<CR>

" run build command
noremap <Leader>b :make!<CR>

"nnoremap <leader>z :YcmCompleter GoTo<CR>
"nnoremap <leader>j :YcmCompleter GoToReferences<CR>
"nnoremap <leader>i :YcmCompleter GoToImplementation<CR>
"nnoremap <leader>z :YcmCompleter GoToDefi<CR>
nnoremap <leader>t :vertical resize +10<CR>
nnoremap <leader>g :vertical resize -10<CR>
nnoremap <F7> :UndotreeToggle<CR>

" plugin 'Chiel92/vim-autoformat' required install clang and astyle
"nnoremap <leader>f :Autoformat<CR>
"vnoremap <leader>f :Autoformat<CR>
"let g:autoformat_verbosemode=1
"let g:formatdef_html_custom='"html-beautify -w 40"'
"let g:formatters_html = ['html_custom']
"nnoremap <leader>gq :%!html-beautify -w 40<CR>
"vnoremap <leader>gq :!html-beautify -w 40<CR>

nmap <Leader>e <Plug>(Prettier)
nnoremap <leader>e :Prettier<CR>
vnoremap <leader>e :PrettierPartial<CR>

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set statusline=\ %<%F%m%r%h%w\ %=[%l,%v]\ [%L]\ %=[%3p%%]
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{FugitiveStatusline()}
set statusline+=%*

" configure coc.nvim +++
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap<expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap<expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap ff  <Plug>(coc-format)
nmap ff  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>zzp` for current paragraph
xmap <leader>z  <Plug>(coc-codeaction-selected)
nmap <leader>z  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>zc  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of
"languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" TODO TAB is used for jump navigation, so it override <C-i> 'jump' 
" forward to the next (newer) location
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" configure coc.nvim ---

"autocmd StdinReadPre * let s:std_in=1
" open a NERDTree automatically when vim starts up if no files were specified 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" remove signcolumn 
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

set autoread

" fugitive git plugin
" delete fugitive buffer automatical
autocmd BufReadPost fugitive://* set bufhidden=delete

" To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Disable completion for java
"autocmd FileType java let b:coc_suggest_disable = 1

" Read additional .vimrc file in current directory
set exrc
set secure

" vimdiff - hide break lines diff
set diffopt+=iwhite
set diffexpr=""

" code fold
let g:javascript_plugin_flow = 1
"set foldmethod=syntax
"set foldlevelstart=20
"set foldlevelstart=0
let javaScript_fold=1
"let c_no_comment_fold = 1

"let g:xml_syntax_folding=1
"au FileType xml,html,xhtml setlocal foldmethod=indent
"autocmd Syntax xml,html,xhtml setlocal foldmethod=indent

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

" open vertical diff
nmap ,vd :Gvdiffsplit<CR>
" open git status
map zz :Git<CR>

" highlighting jsx.erb file support
autocmd BufRead,BufNewFile *jsx.erb set filetype=javascript

" save file
map fw :w<CR>
map fwq :wq<CR>

let g:lsp_cxx_hl_use_text_props = 1

" java highlighting 
"let java_comment_strings=1
let java_highlight_functions=1
"let java_highlight_java_lang_ids=1
"let java_highlight_functions = 1
"let java_highlight_all = 1

" TODO: not work
"let mapleader=","

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

let g:vimspector_enable_mappings = 'HUMAN'

function! JavaStartDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function! JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))
endfunction

nmap <F1> :call JavaStartDebug()<CR>

map + :exe "resize " . (winheight(0) * 3/2)<CR>
map - :exe "resize " . (winheight(0) * 2/3)<CR>

" disable auto-insert line breaks, but will keep line wrapping
set tw=0

set diffopt=vertical

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" Fix problem
nnoremap fi :CocFix<CR>
nnoremap fp :CocCommand eslint.executeAutofix<CR>

" use only for vim-X11
"set clipboard=unnamed
set clipboard=unnamedplus

" mnemonic 'di' = 'debug inspect'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '/home/ilya/development/checkstyle-8.27-all.jar'
let g:syntastic_java_checkstyle_conf_file = '/home/ilya/workspaces/hcs/config/checkstyle/checkstyle.xml'

let g:syntastic_java_checkstyle_post_args =
    \ ["-p", "/home/ilya/dotfiles/checkstyle.properties"]

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["java"] }

" for mintty-colors-solarized
" let g:solarized_termtrans=1
set background=dark   " Setting dark mode
" colorscheme solarized
colorscheme NeoSolarized
set hlsearch

set colorcolumn=120
"highlight ColorColumn ctermbg=darkgray
" let g:ackhighlight = 1
" au FileType qf setlocal colorcolumn= " set nocolorcolumn in quickfix window

nnoremap <Leader>a :Grepper -tool ag -cword -noprompt<cr>
