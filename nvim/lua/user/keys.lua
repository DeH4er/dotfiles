local function map(mode, shortcut, command, opts)
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

local function nnoremap(shortcut, command)
  map('n', shortcut, command, { noremap = true })
end

local function nnoremap_silent(shortcut, command)
  map('n', shortcut, command, { noremap = true, silent = true })
end

local function inoremap(shortcut, command)
  map('i', shortcut, command, { noremap = true })
end

local function vnoremap(shortcut, command)
  map('v', shortcut, command, { noremap = true })
end

local function vnoremap_silent(shortcut, command)
  map('v', shortcut, command, { noremap = true, silent = true })
end

nnoremap('<f1>', '<nop>')
nnoremap('<c-.>', '<nop>')
inoremap('<bs>', '<nop>')
inoremap('<c-space>', '<nop>')

inoremap('<c-k>', '<c-o>O')
inoremap('<c-j>', '<c-o>o')

nnoremap(';', ':')
vnoremap(';', ':')
nnoremap(':', '<nop>')
vnoremap(':', '<nop>')

nnoremap_silent('<leader>w', ':w!<cr>')
nnoremap('<leader>q', '<c-w>q')

nnoremap('<', '<<')
nnoremap('>', '>>')
vnoremap('>', '>gv')
vnoremap('<', '<gv')

nnoremap_silent('<leader>ll', ':nohlsearch<cr>')

inoremap('jk', '<esc>')

-- create windows
nnoremap_silent('<leader>.w', ':vs<cr>')
nnoremap_silent('<leader>.W', ':sp<cr>')

-- window movement
nnoremap('<C-j>', '<C-W>j')
nnoremap('<C-k>', '<C-W>k')
nnoremap('<C-l>', '<C-W>l')
nnoremap('<C-h>', '<C-W>h')

-- tab movement
nnoremap_silent('<leader>,t', ':tabp<cr>')
nnoremap_silent('<leader>.t', ':tabn<cr>')
nnoremap_silent('<leader>,T', ':tabclose<cr>')
nnoremap_silent('<leader>.T', ':tabnew<cr>')

-- resize windows
local dw = 15
nnoremap_silent('<leader>,r', ':exe "vertical resize " . (winwidth(0) -' .. dw .. ')<cr>')
nnoremap_silent('<leader>.r', ':exe "vertical resize " . (winwidth(0) +' .. dw .. ')<cr>')
nnoremap_silent('<leader>,R', ':exe "resize " . (winheight(0) -' .. dw .. ')<cr>')
nnoremap_silent('<leader>.R', ':exe "resize " . (winheight(0) +' .. dw .. ')<cr>')
nnoremap('<leader><leader>', '<c-w>=')

-- better movement
nnoremap(',', '/')
nnoremap('/', '<nop>')
vnoremap(',', '/')
vnoremap('/', '<nop>')

-- clipboard
nnoremap('<leader>p', '"+p')
nnoremap('<leader>y', '"+y')
vnoremap('<leader>p', '"+p')
vnoremap('<leader>y', '"+y')

-- change word under the cursor
vim.cmd([[
  nnoremap <leader>c *``cgn
  vnoremap <leader>c y/\V<C-R>=escape(@",'/\')<CR><CR>``cgn
  vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

-- open terminal
nnoremap_silent('<leader>\'', ':sp<cr><C-w>J:res 10<cr>:terminal<cr>i')

nnoremap_silent('<leader>o', ':Telescope find_files<cr>')
nnoremap_silent('<leader>f', ':Telescope live_grep<cr>')
vnoremap_silent('<leader>f', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>')

nnoremap_silent('<leader><tab>', ':NvimTreeToggle<cr>')

nnoremap_silent('<leader>c', ':TextCaseOpenTelescope<cr>')
