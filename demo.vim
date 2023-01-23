"function! ToggleSyntax()
   "if exists("g:syntax_on")
      "syntax off
   "else
      "syntax enable
   "endif
"endfunction

"call ToggleSyntax()


function CheckClipboard()
   if has("unnamedplus")
       echo "has unnamedplus"
   else
       echo "not has unnamedplus"
   endif
endfunction

function ReadTerminalBgColor()
    "dark ColorBackground=#002b36
    "light ColorBackground=#fdf6e3
    vimgrep /ColorBackground/ ~/.config/xfce4/terminal/terminalrc
endfunction

call ReadTerminalBgColor()
