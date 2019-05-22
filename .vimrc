" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required

filetype off                  " required

"let g:ctrlp_custom_ignore = 'vendor\/bundle|coverage|test\/reports|bower_components|app\/bower_components'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '.git$|vendor|.hg$|.svn$|.yardoc|public/images|public/system|data|log|tmp$|bower_components|node_modules|tmp|dist|target|coverage',
      \ 'file': '.exe$|.so$|.dat$'
      \ }
"let g:NERDTreeIgnore=['~$', 'vendor', 'bower_components','node_modules']
set wildignore+=*\vendor\**
set wildignore+=*\bower_components\**
set wildignore+=*\node_modules\**
set wildignore+=*\tmp\**
set wildignore+=*\dist\**
set wildignore+=*\target\**

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Test those things
Plug 'janko-m/vim-test'

" Lets try these out
Plug 'http://github.com/rstacruz/sparkup', {'rtp': 'vim/'}

" Old ones
Plug 'rking/ag.vim'

" Syntax Highlighting/Languages
"Plug 'isRuslan/vim-es6'
Plug 'towolf/vim-helm'
Plug 'vim-scripts/Handlebars'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'othree/yajs.vim' " Yet another Javascript Sytnax
"Plug 'nono/vim-handlebars'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vim-scripts/vim-json-bundle'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/indentpython.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'mklabs/grunt.vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'vim-scripts/maven-plugin'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'cespare/vim-toml'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':./install.sh', 'for': 'typescript'}
Plug 'larsbs/vim-xmll'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'JulesWang/css.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'mxw/vim-jsx'
Plug 'alampros/vim-styled-jsx'

Plug 'kien/rainbow_parentheses.vim'
" :RainbowParenthesesToggle

" Lets enable :CarbonNowSh for some source code to make a graphic
Plug 'kristijanhusak/vim-carbon-now-sh'

" GIT SUPPORT
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/candycode.vim'
Plug 'larsbs/vimterial_dark'

" Lets see a nice status line
"Plug 'itchyny/lightline.vim'

" Other
Plug 'vim-scripts/Rename'
Plug 'skwp/vim-html-escape'
" :Rename
"Plug 'rename.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'taq/vim-git-branch-info'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'mklabs/vim-issues'
Plug 'vim-scripts/gitdiff.vim'
Plug 'vim-scripts/bufexplorer.zip'
" Plug 'minibufexpl.vim'

Plug 'godlygeek/csapprox'

if !has('nvim')
  Plug 'Shougo/neocomplete.vim'
else
"   " For async completion
"  Plug 'Shougo/deoplete.nvim'
" " For Denite features
"  Plug 'Shougo/denite.nvim'
"  Plug 'mhartington/deoplete-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }
"  let g:deoplete#enable_at_startup = 1
endif
Plug 'mhartington/oceanic-next'

filetype plugin indent on                   " required!
" All of your Plugins must be added before the following line
call plug#end()
syntax on

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" File types
autocmd BufNewFile,BufRead *.gradle setf groovy

" include tags generated by guard-ctags
set tags+=gems.tags

" Old Config Starts here
let g:Perl_PerlTags        = 'enabled'

" Remember what line number
if has('vim')
  set viminfo='10,\"100,:20,%,n~/.viminfo
end
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endi

"	because we prefer terse error messages,
set terse
"	keep the screen tidy
if has('vim')
  set redraw optimize
end
" use spaces rather then tabs, with a width of 2
set tabstop=2
set shiftwidth=2
set expandtab

" Auto indent after a {
"set autoindent
"set smartindent

" Linewidth to endless
set textwidth=0


" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
set dictionary-=~/symvimny/funclist.txt dictionary+=~/symvimny/funclist.txt
" Use the dictionary completion
set complete-=k complete+=k

"set ignorecase                  " caseinsensitive searches-
set showmode                    " always show command or insert mode-
set ruler                       " show line and column information-
set showmatch                   " show matching brackets
set formatoptions=tcqor
set whichwrap=b,s,<,>,[,]       " cursors will now wrap

" Toggle Numbers
map <F12> :set number!<CR>
" Paste
"map <F11> :set paste!<bar>set paste?<CR>
" Wrap
"map <F10> :set wrap!<bar>set wrap?<CR>

map [ cprev<CR>
map ] cnext<CR>


let SVNCommandEnableBufferSetup=1
let SVNCommandCommitOnWrite=1
let SVNCommandEdit='split'
let SVNCommandNameResultBuffers=1
let SVNCommandAutoSVK='svk'

" Svn logs only
au BufNewFile,BufRead  svn-commit.* setf svn
au FileType svn map <Leader>sd :SVNCommitDiff<CR>

map <Leader>dd :SVNVimDiff<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Do not redraw, when running macros.. lazyredraw
set lz
"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I hate folds
set nofoldenable
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
"set wrap

" Do not wrap lines automatically
set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   """"""""""""""""""""""""""""""
   " HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1


   """"""""""""""""""""""""""""""
   " JavaScript section
   """""""""""""""""""""""""""""""
   au FileType javascript setl nocindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

function! GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction

"vmap <leader>d :%s/<c-r>=GetVisual()<cr>/Data::Dumper::Dumper(\1)/
vnoremap <leader>dd "hy:%s/<C-r>h/Data::Dumper::Dumper(<C-r>h)/<CR>
nnoremap <leader>f ma[[k"xyy`a:echo @x<CR>


""""""""
"""" Shortcuts
""""""""
nnoremap <silent> `1 :NERDTreeToggle<CR>
nnoremap <silent> `2 :TlistToggle<CR>

" Don't use Ex mode, use Q for formatting
map Q gq


""" Tab stuff
"Tab configuration
"map <leader>tn :tabnew %<cr>
map <leader>te :tabedit<space>
map <leader>tm :tabmove<space>
map <leader>tn :tabnew<space>

set stal=1

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"" \w will switch windows and resize
noremap <Leader>w <C-W><C-W>:res<cr>

autocmd BufNewFile,BufRead .jshintrc,*.json set filetype=json
"autocmd BufNewFile,BufRead *.es6 set filetype=javascript
function! FileTypeJS()
    "compiler javascript
    set iskeyword-=.
    map <Leader>rr :w<CR>:exe ":!node " . getreg("%") . "" <CR>
endfunction

""""""""""""""""""""""""""""""
" PHP section
""""""""""""""""""""""""""""""
autocmd BufRead  *.module set filetype=php
autocmd BufRead  *.inc set filetype=php
autocmd BufRead  *.install set filetype=php


function! FileTypePHP()
    compiler php
"    map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
    set makeprg=php\ -l\ %
    set errorformat=%m\ in\ %f\ on\ line\ %l
    map <Leader>rr :w<CR>:exe ":!php " . getreg("%") . "" <CR>
    map <Leader>rs :make %<cr>
endfunction

""""""""""""""""""""""""""""""
" Ruby section
""""""""""""""""""""""""""""""
autocmd BufRead Vagrantfile set filetype=ruby
autocmd BufRead *.cap set filetype=ruby

function! FileTypeRuby()
    compiler ruby
    set tabstop=2
    set shiftwidth=2
    set makeprg=ruby\ -c\ %
"    set errorformat=%m\ in\ %f\ on\ line\ %l
"    map <Leader>rr :make %<cr>
    map <Leader>rt :w<CR>:exe ":!ruby -Itest " . getreg("%") . "" <CR>
    map <Leader>rr :w<CR>:exe ":!ruby " . getreg("%") . "" <CR>
endfunction

function! FileTypePython()
  set tabstop=4
  set shiftwidth=4
  map <Leader>rr :w<CR>:exe ":!python " . getreg("%") . "" <CR>
endfunction

function! FileTypeGo()
  map <leader>rr <Plug>(go-run)
endfunction

autocmd BufNewFile,BufRead *.ejs    set filetype=html.javascript

autocmd FileType javascript call FileTypeJS()
autocmd FileType php call FileTypePHP()
autocmd FileType python call FileTypePython()
autocmd FileType ruby call FileTypeRuby()
autocmd FileType go call FileTypeGo()
let g:ShowFuncSortType = "no"
set iskeyword-=.


map <Leader>s :tabnew<CR>:Scratch<CR>

let g:ctags_statusline=1
let g:ctags_title=0
let g:generate_tags=1 
let g:ctags_regenerate=1

noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
" One way to make sure to remove all training whitespace in a file is to set
" an autocmd in your .vimrc file. Everytime the user issue a :w command, Vim
" will automatically remove all trailing whitespace before saving.
autocmd BufWritePre *.pp :%s/\s\+$//e

set nonumber

nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>p :set paste!<CR>

" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"------------Air/Power/Lightline-------
set laststatus=2
"let g:lightline = { 'colorscheme': 'solarized', }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'modified'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

"------------Make ctrl+p open in new tab---------
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufRead  Jenkinsfile set filetype=groovy
autocmd BufRead *.es6 set filetype=javascript


" Neovim enables mouse mode by default
set mouse=

" "------- neomake
" let g:neomake_javascript_enabled_makers = ['eslint_d']
" let g:neomake_open_list = 2
" " When writing a buffer.
" call neomake#configure#automake('w')
" " When writing a buffer, and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing.
" call neomake#configure#automake('rw', 1000)
 
"------- ALE linter stuff thing
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\ }
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
let g:ale_javascript_prettier_eslint_use_global = 1
let g:ale_markdown_mdl_executable = expand("$HOME/bin/mdl")
let g:ale_fix_on_save = 1


"------- neoformat
" let g:neoformat_enabled_javascript = ['prettier-eslint', 'eslint_d']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

set background=light
set background=dark
colorscheme candycode

set cursorline

"---------- vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"let test#strategy = "tmux"

" disable scroll weel/trackpad doing stuff -
" https://superuser.com/questions/610937/how-to-disable-scroll-wheel-in-vim

nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
