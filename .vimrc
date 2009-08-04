" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

let g:Perl_AuthorName      = 'Gavin Mogan'
let g:Perl_AuthorRef       = 'Gavinm'
let g:Perl_Email           = 'gavinm@airg.com'
let g:Perl_Company         = 'airG'
let g:Perl_PerlTags        = 'enabled'

"colorscheme default
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
autocmd! BufNewFile,BufRead *.epl,*.xhtml setf embperl
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
   " Ruby & PHP section
   """"""""""""""""""""""""""""""
   augroup php
       autocmd BufRead  *.module set filetype=php
       autocmd BufRead  *.inc set filetype=php
       autocmd BufRead  *.install set filetype=php

       autocmd FileType ruby map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
       autocmd FileType php compiler php
       autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
   augroup END
   
   """"""""""""""""""""""""""""""
   " Perl Section
   """"""""""""""""""""""""""""""
"   augroup perl
       autocmd BufNew,BufRead  *.pl,*.pm   set filetype=perl

       autocmd FileType perl compiler perl
       "autocmd FileType perl map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
       " Adding the following to your vimrc file will make POD documentation in Perl modules easier to read:
       autocmd FileType perl let perl_include_pod=1
       autocmd FileType perl let g:perldoc_program='/usr/bin/perldoc'
       autocmd FileType perl set comments=:# cinkeys=0{,0},0),:,!^F,o,O,e

       " Fix cindent commenting style to support comments on same line
"       autocmd BufNew,BufRead *.p[lm] perl set cindent
"       autocmd BufNew,BufRead *.p[lm] perl set set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e
"  augroup END


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

set laststatus=2 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

""""""""
"""" Shortcuts 
""""""""
nnoremap <silent> `1 :NERDTreeToggle<CR>
nnoremap <silent> `2 :TlistToggle<CR>

