" vim:fen fdm=marker fdl=1
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Plugins {{{1
call plug#begin()
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'sheerun/vim-polyglot'
call plug#end()

" Terminal {{{1
" ======== BEGIN KITTY SETTINGS ========

" Taken from Kitty FAQ:
" https://sw.kovidgoyal.net/kitty/faq/#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim

" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" ======== END KITTY SETTINGS ========

" Options {{{1
set belloff=all
set mouse=a
set modeline

set number
set title
set termguicolors
set cursorline
set laststatus=2
set cmdheight=2
set listchars=eol:$,tab:-->,space:·
set lazyredraw

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set swapfile
set backup
set writebackup
set directory=$HOME/.cache/vim/swap//,.,$HOME/tmp,/var/tmp,/tmp
set backupdir=$HOME/.cache/vim/backup//,.,$HOME/tmp,$HOME

" Color Scheme {{{1
if has('gui_running')
    set background=light
    colorscheme solarized
else
    colorscheme catppuccin_mocha
endif

" Keymaps {{{1
let mapleader=" "

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>hg :HeaderguardAdd<CR>

imap jj <Esc>
imap JJ <Esc>

" Other {{{1
" Set IBeam shape in insert mode,
" underline shape in replace mode and
" block shape in normal mode.
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"

