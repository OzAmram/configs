set nocompatible

source $VIMRUNTIME/vimrc_example.vim

set noeb vb t_vb=

set nobackup

set modelines=0

set tabstop=4

set shiftwidth=4

set softtabstop=4

set expandtab

set autoindent
set cindent cinkeys-=0#


set backspace=indent,eol,start


set encoding=utf-8

set scrolloff=3

set autoindent

set showmode

set showcmd

set hidden

set wildmenu

set wildmode=list:longest

set ttyfast

set ruler


set laststatus=2

set number



set ignorecase

set smartcase

set gdefault

set incsearch

set showmatch

set hlsearch

vmap <leader>/ :s:^://<CR>

nnoremap <leader><space> :noh<cr>

nnoremap <tab> %

vnoremap <tab> %



set wrap

set textwidth=79

set formatoptions=qrn1



set wrap

set textwidth=79

set linebreak





set diffexpr=MyDiff()

function MyDiff()

  let opt = '-a --binary '

  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif

  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

  let arg1 = v:fname_in

  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif

  let arg2 = v:fname_new

  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif

  let arg3 = v:fname_out

  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif

  let eq = ''

  if $VIMRUNTIME =~ ' '

    if &sh =~ '\<cmd'

      let cmd = '""' . $VIMRUNTIME . '\diff"'

      let eq = '"'

    else

      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'

    endif

  else

    let cmd = $VIMRUNTIME . '\diff'

  endif

  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq

endfunction


