set background=dark
" colorscheme flattened_dark
" colorscheme solarized
" colorscheme solarized8
colorscheme NeoSolarized

highlight CocFloating ctermbg=8
autocmd ColorScheme * hi CocFloating ctermbg=8

" highlight CocSearch ctermfg=4
" autocmd ColorScheme * hi CocSearch ctermfg=4

highlight CocMenuSel ctermbg=0
autocmd ColorScheme * hi CocMenuSel ctermbg=0

let $BAT_THEME="Solarized (dark)"
let $FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,marker:230,spinner:136"

highlight FgCocHintFloatBgCocFloating ctermfg=10
autocmd ColorScheme * hi FgCocHintFloatBgCocFloating ctermfg=10

highlight DiagnosticHint ctermfg=10
autocmd ColorScheme * hi DiagnosticHint ctermfg=10
