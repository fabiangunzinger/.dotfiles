let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/nvim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +120 oldnvim.vim
badd +1 init.lua
badd +63 lua/plugins/editing.lua
badd +9 lua/plugins/lsp.lua
badd +41 lua/config/global.lua
badd +66 test/test.qmd
badd +1 test.py
badd +12 lua/config/keymap.lua
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lua/config/keymap.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt lua/config/global.lua
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
nnoremap <buffer> <silent>  ll <Cmd>lua vim.lsp.codelens.run()
nnoremap <buffer> <silent> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> <silent> [d <Cmd>lua vim.diagnostic.goto_prev()
nnoremap <buffer> <silent> ]d <Cmd>lua vim.diagnostic.goto_next()
nnoremap <buffer> <silent> gn√û <Nop>
nnoremap <buffer> <silent> gr <Cmd>Telescope lsp_references
nnoremap <buffer> <silent> gi <Cmd>Telescope lsp_implementations
nnoremap <buffer> <silent> gh <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> <silent> gd <Cmd>Telescope lsp_definitions
nnoremap <buffer> <silent> gD <Cmd>Telescope lsp_type_definitions
xnoremap <buffer> <silent> grm :lua require'nvim-treesitter.incremental_selection'.node_decremental()
xnoremap <buffer> <silent> grc :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
xnoremap <buffer> <silent> grn :lua require'nvim-treesitter.incremental_selection'.node_incremental()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=:--
setlocal commentstring=--\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=\\<function\\|\\<local\\%(\\s\\+function\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'lua'
setlocal filetype=lua
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatoptions=jcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=tr(v:fname,'.','/')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal linebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes:1
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_b_command#\ ÓÇ†\ quarto\ %<%#lualine_c_normal#\ \ \ You\ ‚Ä¢\ Sun\ \ 2\ Apr\ 10:39:55\ 2023\ ‚Ä¢\ Clone\ quarto-kickstarter\ distro\ %#lualine_c_normal#%=%#lualine_c_normal#\ utf-8\ %#lualine_c_normal#\ Óúí\ %#lualine_x_filetype_DevIconLua_command#\ Óò†%#lualine_c_normal#\ lua\ %#lualine_b_command#\ \ 3%%\ %#lualine_a_command#\ \ 12:18\ 
setlocal suffixesadd=.lua
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
186
normal! zo
let s:l = 12 - ((11 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 018|
wincmd w
argglobal
if bufexists(fnamemodify("oldnvim.vim", ":p")) | buffer oldnvim.vim | else | edit oldnvim.vim | endif
if &buftype ==# 'terminal'
  silent file oldnvim.vim
endif
balt oldnvim.vim
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
snoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
snoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "W")
snoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "W")
nnoremap <buffer> <silent> gn√û <Nop>
xnoremap <buffer> <silent> grm :lua require'nvim-treesitter.incremental_selection'.node_decremental()
xnoremap <buffer> <silent> grc :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
xnoremap <buffer> <silent> grn :lua require'nvim-treesitter.incremental_selection'.node_incremental()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=jcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=endif,=enddef,=endfu,=endfor,=endwh,=endtry,=},=else,=cat,=finall,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes:1
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%#lualine_a_command#\ COMMAND\ %#lualine_b_command#\ ÓÇ†\ quarto\ %<%#lualine_c_normal#\ \ \ You\ ‚Ä¢\ Sun\ \ 2\ Apr\ 10:39:55\ 2023\ ‚Ä¢\ Clone\ quarto-kickstarter\ distro\ %#lualine_c_normal#%=%#lualine_c_normal#\ utf-8\ %#lualine_c_normal#\ Óúí\ %#lualine_x_filetype_DevIconLua_command#\ Óò†%#lualine_c_normal#\ lua\ %#lualine_b_command#\ \ 3%%\ %#lualine_a_command#\ \ 12:18\ 
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
3
normal! zo
64
normal! zo
137
normal! zo
let s:l = 68 - ((10 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 68
normal! 015|
wincmd w
wincmd =
tabnext
argglobal
enew
file NeogitStatus
balt lua/plugins/editing.lua
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
nnoremap <buffer> <nowait> <silent> 	 <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 22)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 19)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 3)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 15)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 1)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 14)
nnoremap <buffer> <nowait> <silent>  <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 2)
nnoremap <buffer> <nowait> <silent> # <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 7)
nnoremap <buffer> <nowait> <silent> $ <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 12)
nnoremap <buffer> <nowait> <silent> 1 <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 5)
nnoremap <buffer> <nowait> <silent> 2 <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 21)
nnoremap <buffer> <nowait> <silent> 3 <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 27)
nnoremap <buffer> <nowait> <silent> 4 <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 20)
nnoremap <buffer> <nowait> <silent> ? <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 16)
nnoremap <buffer> <nowait> <silent> D <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 8)
nnoremap <buffer> <nowait> <silent> L <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 4)
nnoremap <buffer> <nowait> <silent> P <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 28)
nnoremap <buffer> <nowait> <silent> S <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 25)
nnoremap <buffer> <nowait> <silent> U <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 13)
nnoremap <buffer> <nowait> <silent> Z <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 10)
nnoremap <buffer> <nowait> <silent> b <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 17)
nnoremap <buffer> <nowait> <silent> c <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 24)
nnoremap <buffer> <nowait> <silent> d <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 18)
nnoremap <buffer> <nowait> <silent> p <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 9)
nnoremap <buffer> <nowait> <silent> q <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 29)
nnoremap <buffer> <nowait> <silent> r <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 23)
vnoremap <buffer> <nowait> <silent> s <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 26)
nnoremap <buffer> <nowait> <silent> s <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 26)
vnoremap <buffer> <nowait> <silent> u <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 11)
nnoremap <buffer> <nowait> <silent> u <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 11)
vnoremap <buffer> <nowait> <silent> x <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 6)
nnoremap <buffer> <nowait> <silent> x <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 6)
nnoremap <buffer> <nowait> <silent> <C-S> <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 15)
nnoremap <buffer> <nowait> <silent> <C-V> <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 14)
nnoremap <buffer> <nowait> <silent> <C-R> <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 3)
nnoremap <buffer> <nowait> <silent> <C-X> <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 2)
nnoremap <buffer> <nowait> <silent> <C-T> <Cmd>lua require 'neogit.lib.mappings_manager'.invoke(67, 1)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=wipe
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'NeogitStatus'
setlocal filetype=NeogitStatus
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=jtq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal nolist
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes:1
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statuscolumn=
setlocal statusline=%#lualine_a_normal#\ NORMAL\ %#lualine_b_normal#\ ÓÇ†\ quarto\ %<%#lualine_c_normal#\ \ \ Not\ Committed\ Yet\ %#lualine_c_normal#%=%#lualine_c_normal#\ Óúí\ %#lualine_x_filetype_DevIconDefault_normal#\ Óòí%#lualine_c_normal#\ NeogitStatus\ %#lualine_b_normal#\ 69%%\ %#lualine_a_normal#\ \ 23:1\ \ 
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'NeogitStatus'
setlocal syntax=NeogitStatus
endif
setlocal tagfunc=
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=
setlocal winblend=0
setlocal winhighlight=Folded:NeogitFold
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
