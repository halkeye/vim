filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on



" turn off vi compat
set nocompatible

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

let g:Perl_PerlTags        = 'enabled'

function! LoadWorkAuthor()
    let g:Perl_AuthorName      = 'Gavin Mogan'
    let g:Perl_AuthorRef       = 'Gavinm'
    let g:Perl_Email           = 'gavinm@airg.com'
    let g:Perl_Company         = 'airG'
endfunction

function! LoadHomeAuthor()
    let g:Perl_AuthorName      = 'Gavin Mogan'
    let g:Perl_AuthorRef       = 'Gavin'
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
set tabstop=4
set shiftwidth=4
set expandtab

" this will show tabs and trailing spaces
"set list
"set listchars=tab:>-,trail:-


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
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"set ignorecase                  " caseinsensitive searches-
set showmode                    " always show command or insert mode-
set ruler                       " show line and column information-
set showmatch                   " show matching brackets
set formatoptions=tcqor
set whichwrap=b,s,<,>,[,]       " cursors will now wrap

" }}} Symfony Code Templates

"autocmd BufNewFile */validate/*.yml 0r ~/symvimny/validate.yml
"autocmd BufNewFile */config/schema.xml 0r ~/symvimny/schema.xml
autocmd BufNewFile *.yml set tabstop=2
autocmd BufNewFile *.yml set shiftwidth=2

"autocmd BufNewFile *template* set tabstop=2
"autocmd BufNewFile *template* set shiftwidth=2

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
"   function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"     function! FoldText()
"       return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
"   endfunction
"   au FileType javascript call JavaScriptFold()
"   au FileType javascript setl fen

   au FileType javascript imap <c-t> console.log();<esc>hi
   au FileType javascript imap <c-a> alert();<esc>hi
   au FileType javascript setl nocindent
   au FileType javascript inoremap <buffer> $r return

   au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
   au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka

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
set tags=~/.vim/mytags/WAP


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
map <leader>tt :tabnext<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

set stal=1
"try
"  set switchbuf=usetab
"  set stal=1
"catch
"endtry

" 
" Configure tabs for the console version
"
"function MyTabLine()
"        let s = ''
"        let t = tabpagenr()
"        let i = 1
"        while i <= tabpagenr('$')
"                let buflist = tabpagebuflist(i)
"                let winnr = tabpagewinnr(i)
"                let s .= '%' . i . 'T'
"                let s .= (i == t ? '%1*' : '%2*')
"                let s .= ' '
"                let s .= i . ':'
"                let s .= winnr . '/' . tabpagewinnr(i,'$')
"                let s .= ' %*'
"                let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"                let file = bufname(buflist[winnr - 1])
"                let file = fnamemodify(file, ':p:t')
"                if file == ''
"                        let file = '[No Name]'
"                endif
"                let s .= file
"                let i = i + 1
"        endwhile
"        let s .= '%T%#TabLineFill#%='
"        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"        return s
"endfunction
"set tabline=%!MyTabLine()


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

function! FileTypeJS()
    "compiler javascript
    set iskeyword-=.
endfunction

""""""""""""""""""""""""""""""
" Ruby & PHP section
""""""""""""""""""""""""""""""
autocmd BufRead  *.module set filetype=php
autocmd BufRead  *.inc set filetype=php
autocmd BufRead  *.install set filetype=php


function! FileTypePHP()
    compiler php
"    map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
    set makeprg=php\ -l\ %
    set errorformat=%m\ in\ %f\ on\ line\ %l
    map <Leader>rr :make %<cr>
endfunction

autocmd FileType perl call FileTypePerl()
autocmd FileType javascript call FileTypeJS()
autocmd FileType php call FileTypePHP()
let g:ShowFuncSortType = "no"
set iskeyword-=.
