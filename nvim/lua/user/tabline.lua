vim.cmd([[
" tab highlighting
function! HighlightTabLine()
  hi TabLine ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#aaaaaa guibg=#1b1918
  hi TabLineFill ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#282828 guibg=#ababab
  hi TabLineSel ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#689d6a guibg=#ffffff
  hi TabIndex ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#eeeeee guibg=#1b1918
endfunction

" custom tab line
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let s .= '%#TabIndex# ' . (i + 1) . ' '
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel# '
    else
      let s .= '%#TabLine# '
    endif

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    let s .= '%#TabLineFill# '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif

  return s
endfunction

" tab label
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let buffername = bufname(buflist[winnr - 1])

  if buffername == ''
    return '<empty>'
  endif

  let label = fnamemodify(buffername, ':t')
  return label
endfunction

au UIEnter * call HighlightTabLine()
au UIEnter * set tabline=%!MyTabLine()
call HighlightTabLine()
set tabline=%!MyTabLine()
]])
