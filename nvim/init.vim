set nocompatible

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')

call dein#begin('~/.cache/dein')
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#add('kien/ctrlp.vim')
call dein#add('mhinz/vim-startify')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-dispatch')
call dein#add('wincent/ferret')
call dein#add('wellle/targets.vim')
call dein#add('lifepillar/vim-solarized8')
call dein#add('osyo-manga/vim-over')
call dein#add('tpope/vim-projectionist')
call dein#add('Shougo/defx.nvim')
call dein#add('SirVer/ultisnips')
call dein#add('plasticboy/vim-markdown')
call dein#add('tpope/vim-obsession')
call dein#add('mattn/emmet-vim')

" typescript
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})
call dein#add('neoclide/coc-tsserver', {'build': 'yarn install --frozen-lockfile'})

call dein#end()
call dein#save_state()

endif

let mapleader=" "

let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
autocmd FileType html,css EmmetInstall

" config
nnoremap <silent> <leader>ec :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>lc :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>di :call dein#install()<CR>

" misc
nnoremap <f1> <nop>
inoremap <bs> <nop>
nnoremap ; :
vnoremap ; :
nnoremap : <nop>
vnoremap : <nop>
nnoremap <silent> <leader>w :w!<CR>
nnoremap <leader>q <c-w>q
nnoremap <silent> <leader>ll :nohlsearch<CR>
nnoremap < <<
nnoremap > >>
" shift and keep selection
vnoremap < <gv
vnoremap > >gv

nnoremap U <c-r>
vnoremap <silent> <C-a> :call Incr()<CR>
inoremap jk <esc>

" used with projectionist to send tests to tmux
nnoremap <silent> <leader>s :Dispatch!<CR><CR>

" buffer movement
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" better movement
nnoremap , /
nnoremap / <nop>
vnoremap , /
vnoremap / <nop>
nmap s <Plug>(easymotion-overwin-f2)

nnoremap <silent> <leader>,t :tabp<cr>
nnoremap <silent> <leader>.t :tabn<cr>
nnoremap <silent> <leader>,T :tabclose<cr>
nnoremap <silent> <leader>.T :tabnew<cr>

" clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>o :CtrlP<CR>

" find and replace
nnoremap <silent> <Leader>f :call VisualFindAndReplace()<CR>
xnoremap <silent> <Leader>f :call VisualFindAndReplaceWithSelection()<CR>

nnoremap <leader>c *``cgn

" definition
nmap gd <Plug>(coc-definition)
nmap <leader>i <Plug>(coc-fix-current)

" open terminal
nnoremap <silent> <leader>' :sp<CR><C-w>J:res 10<cr>:ProjectDo terminal<CR>i
nnoremap <silent> <leader>" :sp<CR><C-w>J:res 10<cr>:terminal<CR>i

" kill terminal without prompting exit status
au TermClose * exe 'bd!'

" projectionist jump to alternate file
nnoremap <silent> <leader>gt :Etest<CR>
nnoremap <silent> <leader>gh :Ehtmlcomponent<CR>
nnoremap <silent> <leader>gs :Esource<CR>

" normal mode on esc in terminal
tnoremap <esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

" open defx file manager
nnoremap <silent> <leader><tab> :Defx -split=vertical -toggle -winwidth=30 -direction=topleft<CR>
" defx keybindings
autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ?
    \ defx#do_action('open_or_close_tree') :
    \ defx#do_action('drop')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

" cuz why not?
call defx#custom#option('_', {
    \ 'root_marker': 'rm -rf ',
    \ })
call defx#custom#column('filename', {
    \ 'root_marker_highlight': 'Ignore',
    \ })

set hidden
set nowrap
set tabstop=2
set autoindent
set copyindent
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set expandtab
set smarttab
set hlsearch
set incsearch
set visualbell
set noerrorbells
set nobackup
set noswapfile
set mousehide
set cursorline
set scrolloff=3
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. 
set splitright
set splitbelow
set termguicolors
colors solarized8
filetype plugin indent on
syntax on

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

hi TabLine ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#aaaaaa guibg=#1b1918
hi TabLineFill ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#002b36 guibg=#ababab
hi TabLineSel ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#247dd6 guibg=#ffffff
hi TabIndex ctermfg=235 ctermbg=235 gui=reverse,bold guifg=#eeeeee guibg=#1b1918

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


set tabline=%!MyTabLine()
