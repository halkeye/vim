set nocompatible              " be iMproved, required
filetype off                  " required

let g:ctrlp_custom_ignore = 'vendor\/bundle|coverage|test\/reports'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Lets try these out
Bundle "http://github.com/rstacruz/sparkup.git", {'rtp': 'vim/'}

" Old ones
Plugin 'mileszs/ack.vim'

" Programming
Bundle "jQuery"
Bundle "rails.vim"

" Syntax Highlighting/Languages
"Bundle "pangloss/vim-javascript"
Bundle 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/perl-support.vim'
Bundle 'nono/vim-handlebars.git'
Bundle 'vim-scripts/vim-json-bundle.git'
Bundle 'c9s/perlomni.vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'leafgarland/typescript-vim.git'
Bundle 'mklabs/grunt.vim.git'
Bundle 'othree/html5.vim.git'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'rodjek/vim-puppet'

" GIT SUPPORT
Plugin 'tpope/vim-fugitive'

" Color Schemes
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'itchyny/lightline.vim'

Plugin 'vim-scripts/Wombat'
Plugin 'junegunn/seoul256.vim'
Plugin 'vim-scripts/Relaxed-Green'
Plugin 'vim-scripts/rastafari.vim'
Plugin 'vim-scripts/moria'
Plugin 'mitsuhiko/fruity-vim-colorscheme'
Plugin 'vim-scripts/candycode.vim'

" Other
Plugin 'taglist.vim'
Plugin 'taq/vim-git-branch-info'
Plugin 'tmhedberg/matchit'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'ervandew/supertab.git'
Bundle 'bronson/vim-trailing-whitespace.git'
" :FixWhitespace
Bundle 'editorconfig/editorconfig-vim.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'mklabs/vim-issues.git'
Bundle 'vim-scripts/gitdiff.vim.git'
Plugin 'bufexplorer.zip'
Plugin 'minibufexpl.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" File types
autocmd BufNewFile,BufRead *.gradle setf groovy

" Old Config Starts here
let g:Perl_PerlTags        = 'enabled'

function! LoadWorkAuthor()
    let g:Perl_AuthorName      = 'Gavin Mogan'
    let g:Perl_AuthorRef       = 'Gavin Mogan'
    let g:Perl_Email           = 'gavin.mogan@telus.com'
    let g:Perl_Company         = 'TELUS'
endfunction

function! LoadHomeAuthor()
    let g:Perl_AuthorName      = 'Gavin Mogan'
    let g:Perl_AuthorRef       = 'Gavin Mogan'
    let g:Perl_Email           = 'gavin@kodekoan.com'
    let g:Perl_Company         = 'KodeKoan'
endfunction

if $USER != 'halkeye'
    call LoadWorkAuthor()
else
    call LoadHomeAuthor()
endif

"colorscheme default
syntax on
set background=dark
filetype plugin on

" Remember what line number
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endi

"	because we prefer terse error messages,
set terse
"	keep the screen tidy
set redraw optimize
" use spaces rather then tabs, with a width of 2
set tabstop=2
set shiftwidth=2
set expandtab

" Auto indent after a {
"set autoindent
"set smartindent

" Linewidth to endless
set textwidth=0


" Show line numbers by default
"set number

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
set dictionary-=~/symvimny/funclist.txt dictionary+=~/symvimny/funclist.txt
" Use the dictionary completion
set complete-=k complete+=k

" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

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

"" Embperl stuff
augroup filetypedetect
autocmd! BufNewFile,BufRead *.epl,*.xhtml,*.wml setf embperl
augroup END


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

"How many tenths of a second to blink
set mat=2

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
"Enable folding, I find it very useful
"set nofen
"set fdl=0

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
   " VIM
   """"""""""""""""""""""""""""""
   autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.docbook setf docbk
nmap <Leader>px :%!xmllint --format -<CR>
"nmap <Leader>l <Leader>cd:%w !xmllint --valid --noout -<CR>
"nmap <Leader>d4 :%w !xmllint --dtdvalid
" \ "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
" \ --noout -<CR>


"colorscheme rastafari

"set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"""""
""" taglist
""""
"set tags=~/.vim/mytags/WAP


"" use mouse for navigation
set mouse=n

"""" <Leader>dd = Data::Dumper::Dumper($1);
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
map <leader>te :tabedit 
map <leader>tt :TlistToggle<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tn :tabnew

set stal=1

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"" \w will switch windows and resize
noremap <Leader>w <C-W><C-W>:res<cr>

""""""""""""""""""""""""""""""
" Perl Section
""""""""""""""""""""""""""""""
autocmd BufNew,BufRead  *.pl,*.pm   set filetype=perl
autocmd BufRead            *.pod  set filetype=perl
autocmd BufNewFile         *.pod  set filetype=perl
"| call Perl_CommentTemplates("pod")
autocmd BufNewFile,BufRead *.t    set filetype=perl

function! FileTypePerl()
    compiler perl
    " map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
    " Adding the following to your vimrc file will make POD documentation in Perl modules easier to read:
    let perl_include_pod=1
    let g:perldoc_program='/usr/bin/perldoc'
    set comments=:# cinkeys=0{,0},0),:,!^F,o,O,e
    set iskeyword+=_

    " Stop the annoying behavior of leaving comments on far left
    set fo+=r

    " Fix cindent commenting style to support comments on same line
    set cindent
    set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e

    " only work in 'normal' mode
    nnoremap <Leader>qt  :%!perltidy -q<cr>
    " only work in 'visual' mode
    vnoremap <Leader>qt  :!perltidy  -q<cr>
endfunction

autocmd BufNewFile,BufRead .jshintrc,*.json set filetype=json
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

autocmd BufNewFile,BufRead *.ejs    set filetype=html.javascript
autocmd FileType perl call FileTypePerl()
autocmd FileType javascript call FileTypeJS()
autocmd FileType php call FileTypePHP()
autocmd FileType python call FileTypePython()
autocmd FileType ruby call FileTypeRuby()
let g:ShowFuncSortType = "no"
set iskeyword-=.


map <Leader>s :tabnew<CR>:Scratch<CR>

let g:ctags_statusline=1
let g:ctags_title=0
let g:generate_tags=1 
let g:ctags_regenerate=1

noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

let tlist_perl_settings  = 'perl;c:constants;l:labels;p:package;s:subroutines;d:POD'

" if $TERM=screen then
set ttymouse=xterm
nmap <silent> <Leader>tt :CommandT<CR>

" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
" One way to make sure to remove all training whitespace in a file is to set
" an autocmd in your .vimrc file. Everytime the user issue a :w command, Vim
" will automatically remove all trailing whitespace before saving.
autocmd BufWritePre *.pp :%s/\s\+$//e

set nonumber

nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>p :set paste!<CR>

" I hate folds
set nofoldenable

" https://github.com/altercation/vim-colors-solarized
"colorscheme solarized
if has('gui_running')
    let g:solarized_termtrans=1
endif
if !has('gui_running')
  set t_Co=256
endif

" for power line
"set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"let g:Powerline_colorscheme = 'skwp'

" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" http://www.blaulabs.de/2012/12/19/hidden-gems-in-vimruntime/
augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap  P :Pick
  nnoremap  S :Squash
  nnoremap  C :Cycle
endfun

"------------SYNTASTIC-----------
let g:syntastic_coffee_coffeelint_args = "--csv --file $HOME/.vim/coffeelint.json"
let g:syntastic_python_checkers=['pep8']

"------------Air/Power/Lightline-------
set laststatus=2
colorscheme darkblue
let g:lightline = { 'colorscheme': 'solarized', }

"------------Make ctrl+p open in new tab---------
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
"------------Syntastic needs to ignore role attribute for divs---------
let g:syntastic_html_tidy_ignore_errors = [ "<div> proprietary attribute \"role\"" ]
