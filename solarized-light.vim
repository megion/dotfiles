set background=light
" colorscheme flattened_light
" colorscheme solarized
" colorscheme solarized8
colorscheme NeoSolarized

highlight CocFloating ctermbg=15
autocmd ColorScheme * hi CocFloating ctermbg=15

highlight CocMenuSel ctermbg=7
autocmd ColorScheme * hi CocMenuSel ctermbg=7

let $BAT_THEME="Solarized (light)"
let $FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:33,fg+:235,bg+:254,hl+:33 --color info:136,prompt:136,pointer:234,marker:234,spinner:136"

highlight FgCocHintFloatBgCocFloating ctermfg=14
autocmd ColorScheme * hi FgCocHintFloatBgCocFloating ctermfg=14

highlight DiagnosticHint ctermfg=14
autocmd ColorScheme * hi DiagnosticHint ctermfg=14
