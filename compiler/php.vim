" Vim Compiler File
" Compiler:	php
" Maintainer:	Mikolaj Machowski <mikmach@wp.pl>
" Last Change:  2002-01-06 Stephen Thorne <stephen@mu.com.au>
   
if exists("current_compiler")
    finish
endif
let current_compiler = "php"

let s:cpo_save = &cpo
set cpo&vim


" Running :make will run php4's lint filter over the currently
" opened file.
" your PHP cli (or cgi) executable may be different
set makeprg=php\ \-\l\ %\\\|\ grep\ '\ on\ line\ '

" Error format seems to change between versions, if this script
" doesn't seem to work, see if the format is incorrect
" Parse error: syntax error, unexpected T_VARIABLE in apps/default/modules/promotionManager/actions/actions.class.php on line 151

set errorformat=%m\ in\ %f\ on\ line\ %l


let &cpo = s:cpo_save
unlet s:cpo_save
