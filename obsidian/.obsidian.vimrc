" use jk to abort modes and search highlighting
inoremap jk <Esc>
onoremap jk <Esc>
cnoremap jk <C-C>
vnoremap jk v
nnoremap jk :nohlsearch<CR>

" quick save in insert mode
inoremap fd <Esc>:write<CR>a

" search word under cursor
nnoremap gw *N

" make Y behave like C and D
nnoremap Y y$

" move visual-line-wise
nnoremap j gj
nnoremap k gk

" center after search and jumps
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" keep selection after indent/dedent
vnoremap < <gv
vnoremap > >gv

" move highlighted text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" join lines with cursor staying in place
nnoremap J mzJ`z

" add undo break-points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u
inoremap - -<C-g>u

" yank to system clipboard
set clipboard=unnamed

" go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>
