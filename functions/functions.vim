"Function to show documentation"
function ShowDocs() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Only split if no splits
function! ToggleSingleSplit()
    if len(tabpagebuflist()) > 1
        
    else
        vsplit
    endif
endfunction
