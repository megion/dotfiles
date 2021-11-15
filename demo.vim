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

call CheckClipboard()
