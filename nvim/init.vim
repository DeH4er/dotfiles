set nocompatible

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')

call dein#disable('tpope/vim-dispatch')
call dein#disable('tpope/vim-surround')
call dein#disable('junegunn/goyo.vim')
call dein#disable('liuchengxu/vista.vim')
call dein#disable('junegunn/limelight.vim')
call dein#disable('reedes/vim-pencil')
call dein#disable('AndrewRadev/sideways.vim')
call dein#disable('prendradjaja/vim-vertigo')

call dein#begin('~/.cache/dein')
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#add('mhinz/vim-startify')
call dein#add('kien/ctrlp.vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('wellle/targets.vim')
call dein#add('gruvbox-community/gruvbox')
call dein#add('osyo-manga/vim-over')
call dein#add('tpope/vim-projectionist')
call dein#add('Shougo/defx.nvim')
call dein#add('SirVer/ultisnips')
call dein#add('tpope/vim-repeat')
call dein#add('itchyny/lightline.vim')
call dein#add('dyng/ctrlsf.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('purescript-contrib/purescript-vim')
call dein#add('ElmCast/elm-vim')

" typescript
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
" call dein#add('neoclide/coc-tsserver', {'build': 'yarn install --frozen-lockfile'})
" call dein#add('neoclide/coc-tslint-plugin', {'build': 'yarn install --frozen-lockfile'})
" call dein#add('neoclide/coc-json', {'build': 'yarn install --frozen-lockfile'})
" call dein#add('iamcco/coc-angular', {'build': 'yarn install --frozen-lockfile'})
" call dein#add('iamcco/coc-python', {'build': 'yarn install --frozen-lockfile'})

call dein#end()
call dein#save_state()

endif

let mapleader=" "

let g:elm_setup_keybindings=0
let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|ocko-gps|coverage)|(\.(swp|ico|git|svn))|(flex/.*\.(map|js))$'

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_default_root = 'project'

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" let g:goyo_width = 120
" let g:goyo_height = '100%'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \     'gitbranch': 'fugitive#head'
      \   },
      \ }
"
" let g:vista_default_executive = 'coc'

" let g:vista_default_executive = 'coc'

" nnoremap <silent> <leader>a :Goyo<cr>
" nnoremap <silent> <leader>gd :Goyo<cr>

" config
nnoremap <silent> <leader>ec :tabedit ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>lc :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>di :call dein#install()<cr>

" misc
nnoremap <f1> <nop>
inoremap <bs> <nop>
inoremap <c-space> <nop>
inoremap <c-k> <c-o>O
inoremap <c-j> <c-o>o
"nnoremap <leader>f. /\(this\)\@<!\.\w*\.<cr>
nnoremap ; :
vnoremap ; :
nnoremap : <nop>
vnoremap : <nop>
nnoremap <silent> <leader>w :w!<cr>
nnoremap <leader>q <c-w>q
nnoremap <silent> <leader>ll :nohlsearch<cr>
nnoremap < <<
nnoremap > >>

nnoremap : g;
nnoremap Q g,

"
" shift and keep selection
vnoremap < <gv
vnoremap > >gv

" move lines
nnoremap <silent> <leader>j :m .+1<cr>
nnoremap <silent> <leader>k :m .-2<cr>
vnoremap <silent> <leader>j :m '>+1<cr>gv=gv
vnoremap <silent> <leader>k :m '<-2<cr>gv=gv

nnoremap <silent> <leader>u :CocList commands<cr>
vnoremap <silent> <leader>u :CocList commands<cr>
" move arguments
" nnoremap <silent> <leader>ah :SidewaysLeft<cr>
" nnoremap <silent> <leader>al :SidewaysRight<cr>

vnoremap <silent> <C-a> :call Incr()<cr>
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" used with projectionist to send tests to tmux
" nnoremap <silent> <leader>s :Dispatch!<cr><cr>

" window movement
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" create windows
nnoremap <silent> <leader>.w :vs<cr>
nnoremap <silent> <leader>,w :vs<cr><c-w>h
nnoremap <silent> <leader>.W :sp<cr>
nnoremap <silent> <leader>,W :sp<cr><c-w>k

" resize windows
let dw = 15
nnoremap <silent> <leader>,r :exe "vertical resize " . (winwidth(0) - dw)<cr>
nnoremap <silent> <leader>.r :exe "vertical resize " . (winwidth(0) + dw)<cr>
nnoremap <silent> <leader>,R :exe "resize " . (winheight(0) - dw)<cr>
nnoremap <silent> <leader>.R :exe "resize " . (winheight(0) + dw)<cr>
nnoremap <leader><leader> <c-w>=

" better movement
nnoremap , /
nnoremap / <nop>
vnoremap , /
vnoremap / <nop>
nmap s <Plug>(easymotion-overwin-f2)

" tab movement
nnoremap <silent> <leader>,t :tabp<cr>
nnoremap <silent> <leader>.t :tabn<cr>
nnoremap <silent> <leader>,T :tabclose<cr>
nnoremap <silent> <leader>.T :tabnew<cr>

" quickfix movement
nnoremap <silent> <leader>,c :cp<cr>
nnoremap <silent> <leader>.c :cn<cr>
nnoremap <silent> <leader>,C :cclose<cr>
nnoremap <silent> <leader>.C :copen<cr>

" clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>o :CtrlP<cr>

" find and replace
nnoremap <silent> <leader>f :call VisualFindAndReplace()<cr>
xnoremap <silent> <leader>f :call VisualFindAndReplaceWithSelection()<cr>

" change word under the cursor
nnoremap <leader>c *``cgn
vnoremap <leader>c y/\V<C-R>=escape(@",'/\')<CR><CR>``cgn
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" coc bindings
nnoremap <silent> gd :call CocActionAsync('jumpDefinition')<cr>
nmap <leader>i <Plug>(coc-fix-current)
nmap <leader>r <Plug>(coc-references)
nmap <leader>n <Plug>(coc-rename)
nmap <leader>, <Plug>(coc-refactor)
vmap <leader>= <Plug>(coc-format-selected)
nnoremap <leader>= :call CocAction('format')<cr>

" open terminal
nnoremap <silent> <leader>' :sp<cr><C-w>J:res 10<cr>:ProjectDo terminal<cr>i
nnoremap <silent> <leader>" :sp<cr><C-w>J:res 10<cr>:terminal<cr>i

" kill terminal without prompting exit status
au TermClose * exe 'bd!'

au FileType c,cpp setlocal noexpandtab tabstop=8 shiftwidth=8 nolist
au FileType python setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    " \ textwidth=79
    \ expandtab
    \ fileformat=unix

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

" projectionist jump to alternate file
nnoremap <silent> <leader>gt :Etest<cr>
nnoremap <silent> <leader>gh :Ehtml<cr>
nnoremap <silent> <leader>gs :Esource<cr>
nnoremap <silent> <leader>gc :Ecss<cr>

nnoremap <leader>ag :CtrlSF ''<left>
vmap <leader>ag <Plug>CtrlSFVwordExec

" normal mode on esc in terminal
tnoremap <esc> <C-\><C-n>

" open defx file manager
nnoremap <silent> <leader><tab> :Defx -split=vertical -toggle -winwidth=35 -direction=topleft<cr>

" defx keybindings
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

" open file {
  nnoremap <silent><buffer><expr> <cr>
        \ defx#is_directory() ?
        \ defx#do_action("open_directory") :
        \ defx#do_action('open', 'tabnew')

  nnoremap <silent><buffer><expr> L
        \ defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') :
        \ defx#do_action('drop')

  nnoremap <silent><buffer><expr> l
        \ defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') :
        \ defx#do_action('open', 'vsplit')

  nnoremap <silent><buffer><expr> y
  \ defx#do_action('copy')

  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')

  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')

  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')

  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')

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

  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')

  nnoremap <silent><buffer><expr> s
  \ defx#do_action('toggle_select')

  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')

  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('execute_command')

  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')

  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')

  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])

  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')

  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')

  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')

  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
      \ 'root_marker': 'rm -rf ',
      \ })

set colorcolumn=81
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
set noshowmode
set updatetime=300
set showtabline=1
colors gruvbox
filetype plugin indent on
syntax on

set diffopt+=indent-heuristic
set diffopt+=algorithm:patience

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

"function! s:goyo_enter()
"  exe "norm! :Limelight\<cr>"
"endfunction
"
"function! s:goyo_leave()
"  exe "norm! :Limelight!\<cr>"
"  set showtabline=1
"  set tabline=%!MyTabLine()
"  call HighlightTabLine()
"endfunction

au UIEnter * call HighlightTabLine()
au UIEnter * set tabline=%!MyTabLine()

" remove trailing witespace at write
autocmd BufWritePre * %s/\s\+$//e
call HighlightTabLine()
set tabline=%!MyTabLine()
