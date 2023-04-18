" .vimrc, fabian gunzinger

" plugins {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" activate vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'   " show git diff in sign column
Plug 'alfredodeza/pytest.vim'   " pytest support
Plug 'christoomey/vim-tmux-navigator'   " smooth tmux and vim navigation
Plug 'christoomey/vim-tmux-runner'   " send code from vim to tmux processes
plug 'dense-analysis/ale'   " code linting. [dep]: pip install flake8
plug 'fisadev/vim-isort'   " sort python imports
plug 'ggvgc/vim-fuzzysearch'   " fuzzy search
    let g:fuzzysearch_prompt = '/'
    let g:fuzzysearch_match_spaces = 1
plug 'godlygeek/tabular'   " tabular formatting
plug 'plasticboy/vim-markdown'   " markdown support
plug 'hashivim/vim-terraform'   " terraform commands and syntax highlighting
plug 'jremmen/vim-ripgrep'   " search
  let g:rg_command = 'rg --vimgrep -s'   " user smartcase by default
plug 'itchyny/lightline.vim'   " statusbar
plug 'junegunn/goyo.vim'   " distraction free writing
plug 'junegunn/fzf.vim'   " fuzzy search
plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy search
plug 'machakann/vim-highlightedyank'   " highlight yanked region
plug 'mileszs/ack.vim'   " faster grep alternative

plug 'ncm2/ncm2'   " code completion
plug 'roxma/nvim-yarp'   " remote plugin framework required for ncm2
plug 'ncm2/ncm2-bufword'   " complete words in buffer
plug 'ncm2/ncm2-path'   " path completion
plug 'ncm2/ncm2-jedi'   " python completion

Plug 'nelstrom/vim-visual-star-search'   " make * search for visual selection
Plug 'stefandtw/quickfix-reflector.vim'   " use quickfix for bulk change/replace
Plug 'SirVer/ultisnips'   " snippets engine
Plug 'honza/vim-snippets'   " snippets
Plug 'tpope/vim-commentary'   " commenting
Plug 'tpope/vim-eunuch'   " unix shell commands
Plug 'tpope/vim-fugitive'   " git integration
Plug 'tpope/vim-obsession'   " session management
Plug 'tpope/vim-repeat'   " use . after plugin map
Plug 'tpope/vim-surround'   " surround shortcuts
Plug 'tpope/vim-abolish'   " powerful substitution and case conversions
Plug 'tpope/vim-unimpaired'   " complementary pairs of mappings
Plug 'tpope/vim-vinegar'   " complement to netrw file system navigation
Plug 'wincent/command-t', {'do': 'cd lua/wincent/commandt/lib && make'}  " fuzzy file finderlet
    let g:CommandTPreferredImplementation = 'lua'
Plug 'psliwka/vim-smoothie'   " smooth scrolling
Plug 'jpalardy/vim-slime'   " repl interaction support
  let g:slime_target = "tmux"
Plug 'altercation/vim-colors-solarized'   " colorscheme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}   " syntax highlighting
Plug 'psf/black', { 'branch': 'stable' }   " black python formatting
Plug 'jeetsukumaran/vim-pythonsense'   " python text objects
Plug 'Vimjas/vim-python-pep8-indent'   " pep8 style indentation
Plug 'lervag/vimtex'   " latex support
call plug#end()

" Use `:PlugInstall` and `:PlugClean` as needed.


" general {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype detection
filetype plugin on			            " enable filetype plugins
filetype indent on                      " enable filetype indent

" misc.
set history=5000                        " lines to remember
set encoding=utf8                       " standard encoding
set backspace=indent,eol,start          " powerful backspace in insert mode
set spelllang=en_gb                     " spell checker uses british english
set hidden                              " switch away from edited buffers
set laststatus=2			            " always show statusline
" set lazyredraw                      	" avoid undue redrawing
set noerrorbells                    	" disable error bells
set number                              " show line numers
set relativenumber                      " show relative line numbers
set mouse=a                             " mouse support in all modes
set showcmd	                            " show partial command
set updatetime=100                      " shorter update time (for vim-gutter)

" text wrapping
set wrap                            	" wrap long lines
set linebreak                           " don't break word

" splits
set splitright                          " new vertical split on the right
set splitbelow                          " new horizontal split below

" tab stops
set expandtab                           " tabs are spaces
set shiftwidth=4                        " spaces for autoindent
set tabstop=4                           " spaces per <tab> in file
set softtabstop=4                       " spaces per <tab> while editing

" up to here <---

" colors and fonts
syntax enable                           " syntax highlighting
set background=dark                     " dark background
colorscheme solarized                   " custom colorscheme
let python_highlight_all=1

" Clear git-gutter highlighting
highlight clear SignColumn
highlight clear GitGutterAdd
highlight clear GitGutterChange
highlight clear GitGutterDelete


" remove vertical split column highlight
" only fillchar vert default | is shows
highlight VertSplit ctermbg=NONE

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" search {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " case insensitive search...
set smartcase                           " ... except when capitals used
set hlsearch                            " highlight search results
set incsearch                           " incremental result highlight
set infercase                           " adapt change for autocomplete

" Ignore compiled files for filcard expansion and search
set wildignore=*.pyc,*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" netrw settings
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 30


" mappings {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" letters to keep free
" letter    | purpose
" t,b       | command-t search

" ~~~ new and experimental ~~~

" " change windows quickly
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" turn off highlighting
noremap <nowait><leader><leader> :nohlsearch<cr>

" easily open and close quickfix window
nnoremap <silent><leader>cc :cclose<cr>
nnoremap <silent><leader>co :copen<cr>

" delete to end of line in insert mode
inoremap <c-l> <c-o>D


" ~~~ permanent ~~~

let mapleader = ','

" leave insert mode
inoremap jk <esc>

" exit terminal mode
tnoremap jk <c-\><c-n>

" abort (search) command
cnoremap jk <C-c>

" abort operator-pending command
onoremap jk <esc>

" make Y behave like C and D (see `h: Y`)
map Y y$

" write buffer
nnoremap <leader>w :w<cr>

" edit alternate file
nnoremap <silent><leader>a :e#<cr>

" move visual-line-wise
nnoremap j gj
nnoremap k gk

" open files from same directory as current buffer
" ew is for open (edit) new file in window
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :edit %%
map <leader>ev :vsplit %%
map <leader>et :tabedit %%

" make and repeat substitution with flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" switch textwrap on and off (following unimpaired mappings)
nnoremap [ot :set textwidth=80<cr>
nnoremap ]ot :set textwidth=0<cr>

" print markdown headings
nnoremap <leader>mh :g/^#<space><cr>
nnoremap <leader>mhh :g/^#<cr>

" line numbers
nnoremap <silent> <leader>n :setlocal number!<cr>
nnoremap <silent> <leader>nr :setlocal relativenumber!<cr>

" distraction free writing toggle
nnoremap <silent> <leader>dw :Goyo<cr>

" source vimrc
map <silent> <leader>Sv :write<cr>:source $MYVIMRC<cr>zazz
map <silent> <leader>sv :write<cr>:source $MYVIMRC<cr>

" open files shortcuts
map <silent><leader>fvr :edit $MYVIMRC<cr>
map <silent><leader>fvvr :vsplit $MYVIMRC<cr>
map <silent><leader>fve :edit ~/dev/projects/wowchemy/content/post/vim.md<cr>
map <silent><leader>fre :edit ~/dev/projects/wowchemy/content/post/regex.md<cr>
map <silent><leader>fmf :edit ~/dev/projects/wowchemy/content/post/makefiles.md<cr>
map <silent><leader>ffb :edit ~/dev/projects/dotfiles/latex/fabib.bib<cr>
map <silent><leader>fps :edit ~/dev/projects/dotfiles/latex/paper.sty<cr>
map <silent><leader>fbr :edit ~/dev/projects/dotfiles/.bashrc<cr>
map <silent><leader>fli :edit ~/dev/projects/blog/_posts/2021-02-08-linux.md<cr>
map <silent><leader>fto :edit ~/my-notes/todo.md<cr>

" run current file in python
nnoremap <leader>rp :w<cr>:!python %<cr>
nnoremap <leader>rpm :w<cr>:!python -m %<cr>
nnoremap <leader>rpd :w<cr>:!python -m doctest %<cr>

" git
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gg :call GitLazyPush()<cr>
" below doesn't work, as it creates a conflict with pushed commit if pushed
" already. So I need to pull first and merge, then push.
" nnoremap <leader>gam :Git add --all \| Git commit --amend --no-edit<cr>

" pytest
" Remember that things like us and uf are toggable
nnoremap <silent><leader>uff :Pytest file<cr>
nnoremap <silent><leader>uc :Pytest class<cr>
nnoremap <silent><leader>uf :Pytest function<cr>
nnoremap <silent><leader>um :Pytest method<cr>
nnoremap <silent><leader>un :Pytest next<cr>
nnoremap <silent><leader>up :Pytest previous<cr>
nnoremap <silent><leader>us :Pytest session<cr>
nnoremap <silent><leader>ufa :Pytest fails<cr>
nnoremap <silent><leader>uen :Pytest end<cr>
nnoremap <silent><leader>uer :Pytest error<cr>

" black formatting
nnoremap <silent><leader>fo :Black<cr>

" semshi
nnoremap <silent> <leader>gu :Semshi goto unresolved<cr>
nnoremap <silent> <leader>ge :Semshi goto error<cr>

" close buffer but not window
nnoremap Bd :bp\|bd #<cr>

" quick formatting
" nnoremap <silent> <leader>tp gqap<cr>

" command-t
" nnoremap <c-cr> :CommandTOpen vs
" let g:CommandTCancelMap=['<c-c>', 'jk']
nnoremap <leader>t :CommandT<cr>
nnoremap <leader>b :CommandTBuffer<cr>

" vim-gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" easy-motion
let g:EasyMotion_do_mapping = 0   " Disable default mapping
let g:EasyMotion_smartcase = 1   " Case insensitive search
" nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Vim Tmux Runner
" From https://github.com/christoomey/dotfiles/blob/master/vim/rcplugins/tmux-runner
nnoremap <leader>v- :VtrOpenRunner { "orientation": "v", "percentage": 50 }<cr>
nnoremap <leader>v\ :VtrOpenRunner { "orientation": "h", "percentage": 50 }<cr>
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>v0 :VtrAttachToPane 0<cr>:call system("tmux clock-mode -t 0 && sleep 0.1 && tmux send-keys -t 0 q")<cr>
nnoremap <leader>v1 :VtrAttachToPane 1<cr>:call system("tmux clock-mode -t 1 && sleep 0.1 && tmux send-keys -t 1 q")<cr>
nnoremap <leader>v2 :VtrAttachToPane 2<cr>:call system("tmux clock-mode -t 2 && sleep 0.1 && tmux send-keys -t 2 q")<cr>
nnoremap <leader>v3 :VtrAttachToPane 3<cr>:call system("tmux clock-mode -t 3 && sleep 0.1 && tmux send-keys -t 3 q")<cr>
nnoremap <leader>v4 :VtrAttachToPane 4<cr>:call system("tmux clock-mode -t 4 && sleep 0.1 && tmux send-keys -t 4 q")<cr>
nnoremap <leader>v5 :VtrAttachToPane 5<cr>:call system("tmux clock-mode -t 5 && sleep 0.1 && tmux send-keys -t 5 q")<cr>

nnoremap <leader>fr :VtrFocusRunner<cr>

noremap <C-f> :VtrSendLinesToRunner<cr>
" nnoremap <leader>sq :VtrSendKeysRaw q<cr>
" nnoremap <leader>sd :VtrSendKeysRaw ^D<cr>
nnoremap <leader>sl :VtrSendKeysRaw ^L<cr>
nnoremap <leader>sc :VtrSendKeysRaw ^C<cr>
nnoremap <leader>vs :VtrSendCommandToRunner<space>
nnoremap <leader>s1 :VtrSendKeysRaw C-p C-m<cr>

nnoremap <leader>vip :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'ipython'}<cr>
nnoremap <leader>vp :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'python'}<cr>

" sessions {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_dir = '~/.vim/vim-sessions/'
" list *.vim files and then delete pattern so i can starty typing
let g:files_list = '*.vim<c-d><bs><bs><bs><bs><bs>'

" save session (override existing)
exec 'nnoremap <leader>ss :Obsession' . g:session_dir . g:files_list

" restore session (auto tracks changes if exited with !qa)
exec 'nnoremap <leader>sr :source' . g:session_dir . g:files_list


" git {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GitLazyPush()
call inputsave()
let msg = input("Commit message: ")
call inputrestore()
:Git add --all
:execute ":Git commit -m ".'"'.msg.'"'
:Git push   
endfunction


" folding {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable                          " enable folding
" set foldmethod=indent                   " fold based on indent level
" set foldmethod=indent                   " fold based on indent level
" set foldmethod=indent                   " fold based on indent level
" set foldmethod=indent                   " fold based on indent level
set foldlevelstart=99                   " open file with all folds open

" toggle fold under cursor
nnoremap <space> za


" snippets {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ultisnip settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit = "vertical"   

" edit snippets
nnoremap <leader>es :UltiSnipsEdit<cr>
nnoremap <leader>esp :e /Users/fgu/.config/nvim/plugged/vim-snippets/UltiSnips/python.snippets<cr>
nnoremap <leader>est :e /Users/fgu/.config/nvim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>


" python {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" python interpreter
" use dedicated virtual env as nvim intrpreter (:h python3_host_prog), since
" -- when managing pyenv-virtualenv -- automatically detecting virtualenv
" doesn't seem to work.
" let g:python3_host_prog='/Users/fgu/.pyenv/versions/base/bin/python'
" if $USER=="fabian.gunzinger"
" 	let g:python3_host_prog='/Users/fabian.gunzinger/.pyenv/versions/3.10.8/bin/python'
" else
" 	let g:python3_host_prog='/Users/fgu/miniconda3/envs/nvim/bin/python'
" endif

" Strip leading whitespace and empty lines and append extra line when sending
" Python code to repl
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1


" " ncm2
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " Important :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" latex {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use skim as editor
let g:vimtex_view_method = 'skim'   " use skim as editor

" use neovim-remote as compiler
" installation info: https://github.com/lervag/vimtex/issues/1327
let g:vimtex_compiler_progname = $HOME.'/miniconda3/envs/nvim/bin/nvr' 

" markdown {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" disable ge command to keep it free for default movement behaviour
map <Plug> <Plug>Markdown_EditUrlUnderCursor

" status bar {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['gitbranch', 'readonly', 'filename', 'modified'] ] 
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }


" archive {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" writing mode
" custom settings for writing mode
" function! GoyoEnterSettings()
"     set background=light
"     colorscheme seoul256-light
" endfunction
" function! GoyoLeaveSettings()
"     set background=dark
"     colorscheme solarized
" endfunction
" autocmd! User GoyoEnter :call GoyoEnterSettings()
" autocmd! User GoyoLeave :call GoyoLeaveSettings()


" file settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=1
" vim:foldmethod=marker:foldlevel=0
