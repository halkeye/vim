if exists("current_compiler")
  finish
endif
let current_compiler = "embperl"
setlocal makeprg=/home/main/WAP/scripts/templateChecker.pl\ %\ $*
setlocal errorformat=%f:%l:\ %m
