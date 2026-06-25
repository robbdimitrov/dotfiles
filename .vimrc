" ====================================================================
" Plugin-Free IDE-like Vim Configuration
" Classic Vim only, no plugins, no Neovim Lua
" Focus: Docker/Colima, YAML, Markdown, JS/TS, Svelte, React, Angular,
"        Go, Rust, shell, JSON, HTML/CSS, Terraform/HCL
" ====================================================================

" --------------------------------------------------------------------
" Core
" --------------------------------------------------------------------
set nocompatible
set encoding=utf-8
scriptencoding utf-8

filetype plugin indent on
syntax on

set hidden                      " Switch buffers without saving
set backspace=indent,eol,start  " Natural backspace behavior
set autoread                    " Reload files changed outside Vim
set confirm                     " Ask before abandoning unsaved changes
set updatetime=300
set timeoutlen=500
set history=1000

" --------------------------------------------------------------------
" UI
" --------------------------------------------------------------------
set number
set norelativenumber
set cursorline
set ruler
set showcmd
set laststatus=2
set scrolloff=6
set sidescrolloff=8
set wildmenu
set wildmode=longest:full,full
set signcolumn=no
set display+=lastline
set shortmess+=c
set splitbelow
set splitright

set wrap
set linebreak
set nolist

set mouse=a

" Improve contrast for spell checking (using terminal ANSI colors 1, 4, 5, 6)
hi SpellBad cterm=undercurl gui=undercurl guisp=Red ctermbg=NONE ctermfg=1 guibg=NONE guifg=NONE
hi SpellCap cterm=undercurl gui=undercurl guisp=Blue ctermbg=NONE ctermfg=4 guibg=NONE guifg=NONE
hi SpellRare cterm=undercurl gui=undercurl guisp=Magenta ctermbg=NONE ctermfg=5 guibg=NONE guifg=NONE
hi SpellLocal cterm=undercurl gui=undercurl guisp=Cyan ctermbg=NONE ctermfg=6 guibg=NONE guifg=NONE

if has('clipboard')
  set clipboard=unnamedplus
endif

" --------------------------------------------------------------------
" Search
" --------------------------------------------------------------------
set incsearch
set hlsearch
set ignorecase
set smartcase

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" --------------------------------------------------------------------
" Indentation defaults
" --------------------------------------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" --------------------------------------------------------------------
" Files, backups, undo
" --------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile

if has('persistent_undo')
  set undofile
  let s:undo_dir = expand('~/.vim/undo')
  if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir, 'p')
  endif
  execute 'set undodir=' . fnameescape(s:undo_dir)
endif

" --------------------------------------------------------------------
" Leader key
" --------------------------------------------------------------------
let mapleader = "\<Space>"

" --------------------------------------------------------------------
" Navigation mappings
" --------------------------------------------------------------------

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tl :tabnext<CR>

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Save / quit
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

" --------------------------------------------------------------------
" Built-in file explorer: netrw
" --------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 22
let g:netrw_altv = 1
let g:netrw_browse_split = 4

nnoremap <silent> <leader>e :Lexplore<CR>

" --------------------------------------------------------------------
" Built-in completion helpers
" --------------------------------------------------------------------
set completeopt=menuone,noselect
set omnifunc=syntaxcomplete#Complete

" --------------------------------------------------------------------
" Grep/search helpers
" --------------------------------------------------------------------
" Uses ripgrep for blazing fast searches. Automatically respects .gitignore!
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob\ '!.git'
  set grepformat=%f:%l:%c:%m,%f:%l:%m
else
  set grepprg=grep\ -nH\ --exclude-dir=.git\ --exclude-dir=node_modules\ $*
  set grepformat=%f:%l:%m
endif

" Examples:
"   :grep TODO **/*.js
"   :grep docker-compose .
nnoremap <leader>g :grep! 
nnoremap <leader>c :copen<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

" --------------------------------------------------------------------
" Git helpers
" --------------------------------------------------------------------
" No Vim plugin required. Requires the external git command.
if executable('git')
  " Repository status
  command! GitStatus botright new |
        \ setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile |
        \ read !git status --short --branch |
        \ 1delete |
        \ setlocal readonly nomodifiable

  " Current file diff against HEAD
  command! GitDiff execute 'vertical new' |
        \ setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile |
        \ execute 'read !git diff -- ' . shellescape(expand('#:p')) |
        \ 1delete |
        \ setlocal filetype=diff readonly nomodifiable

  " Current file blame
  command! GitBlame execute 'vertical new' |
        \ setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile |
        \ execute 'read !git blame -- ' . shellescape(expand('#:p')) |
        \ 1delete |
        \ setlocal readonly nomodifiable

  " Log for current file
  command! GitLog execute 'botright new' |
        \ setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile |
        \ execute 'read !git log --oneline --decorate --graph -- ' . shellescape(expand('#:p')) |
        \ 1delete |
        \ setlocal readonly nomodifiable

  nnoremap <leader>gs :GitStatus<CR>
  nnoremap <leader>gd :GitDiff<CR>
  nnoremap <leader>gb :GitBlame<CR>
  nnoremap <leader>gl :GitLog<CR>
endif

" --------------------------------------------------------------------
" Filetype detection
" --------------------------------------------------------------------
augroup FiletypeDetection
  autocmd!
  autocmd BufRead,BufNewFile *.svelte setfiletype svelte
  autocmd BufRead,BufNewFile *.tsx setfiletype typescriptreact
  autocmd BufRead,BufNewFile *.jsx setfiletype javascriptreact

  autocmd BufRead,BufNewFile Dockerfile,*.Dockerfile setfiletype dockerfile
  autocmd BufRead,BufNewFile docker-compose*.yml,docker-compose*.yaml,compose*.yml,compose*.yaml setfiletype yaml

  autocmd BufRead,BufNewFile *.env,.env,.env.* setfiletype sh
  autocmd BufRead,BufNewFile *.tf,*.tfvars setfiletype terraform
  autocmd BufRead,BufNewFile *.hcl setfiletype hcl
  autocmd BufRead,BufNewFile *.md,*.markdown setfiletype markdown
augroup END

" --------------------------------------------------------------------
" Language-specific indentation and display rules
" --------------------------------------------------------------------
augroup FiletypeRules
  autocmd!

  " YAML, JSON, frontend, and config-style files: 2 spaces
  autocmd FileType yaml,yml,json,javascript,typescript,javascriptreact,typescriptreact,html,css,scss,sass,less,svelte,vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

  " Angular templates
  autocmd BufRead,BufNewFile *.component.html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

  " Go uses hard tabs
  autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

  " Rust commonly uses 4 spaces
  autocmd FileType rust setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " Shell scripts
  autocmd FileType sh,bash,zsh setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

  " Markdown
  autocmd FileType markdown setlocal wrap linebreak textwidth=0 spell

  " Makefiles require real tabs
  autocmd FileType make setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

  " Dockerfiles
  autocmd FileType dockerfile setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

  " Terraform/HCL
  autocmd FileType terraform,hcl setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" --------------------------------------------------------------------
" Quality of life automation
" --------------------------------------------------------------------
augroup QualityOfLife
  autocmd!

  " Trim trailing whitespace on save (seamless: preserves cursor position and search history)
  autocmd BufWritePre * let s:save_view = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(s:save_view)

  " Restore cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif

  " Resize splits when terminal/window changes size
  autocmd VimResized * wincmd =
augroup END

" --------------------------------------------------------------------
" Useful editing mappings
" --------------------------------------------------------------------

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Move selected lines up/down
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv

" Better page movement: keep cursor centered
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Search next/previous and center result
nnoremap n nzzzv
nnoremap N Nzzzv

" --------------------------------------------------------------------
" Statusline
" --------------------------------------------------------------------
set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=%y
set statusline+=\ 
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=%{&fileformat}
set statusline+=\ 
set statusline+=%l:%c
set statusline+=\ 
set statusline+=%p%%

" ====================================================================
" End
" ====================================================================
