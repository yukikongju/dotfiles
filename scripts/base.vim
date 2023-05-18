"  .vimrc base file

" Remap escape keys to kj in insert mode
" nnoremap kj <esc>
" inoremap kj <esc>


" Remap ; to : in normal and vertical mode
nnoremap ; :
vnoremap ; :


" Remove/Add Space under cursor
nnoremap J mzJ`z
nnoremap K m`o<Esc>``


" Change Cursor Style based on mode
set cursorline " Highlight line under cursor
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode


" change background color
set background=dark
colorscheme gruvbox

" leader
let mapleader=','


" edit and reload vim
nnoremap <silent> <leader>ve :tabnew $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>


