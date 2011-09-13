" Vim syntax file
" Language: HTTP
" Maintainer: Thiebaud Weksteen <tweksteen@gmail.com>
"

" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

" Banners
syn match method "^\(GET\|POST\|PUT\|DELETE\|OPTIONS\|TRACE\)" 
syn match http_version "HTTP/\d\.\d"
syn match response_code_ok    "[ \t][1-3][0-9]\{2\}[ \t][A-Za-z\- ]*\r\?$"
syn match response_code_error "[ \t][4-5][0-9]\{2\}[ \t][A-Za-z\- ]*\r\?$"

" Headers
syn match header "^[A-Za-z0-9\-][^:]*:"
syn match abs_url "https\?:\/\/[A-Za-z0-9\-\.]*"
syn match rel_url "[ \t]\/[A-Za-z0-9\/\-\_\.]*"
syn match amp "\v\&"

" Cookies / Body
syn match key "[^;&? \t]*="

" Extra
syn match IPaddr "\v<\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}>"
syn match clength "^Content-Length:.*$"


if version >= 508 || !exists("did_hs_syntax_inits")
  if version < 508
    let did_hs_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

" Comment, Statement, Type, Function, Constant, PreProc

  hi link header			  Statement
  hi link response_code_ok                Type
  hi link response_code_error             Constant
  hi link method			  Comment
  hi link key				  Comment
  hi link IPaddr			  Function
  hi link abs_url			  PreProc
  hi link rel_url                         Constant
  hi link amp   			  Delimiter
  hi link clength                         Error

  delcommand HiLink
endif

let b:current_syntax = "headers"

