" Vim syntax file
" Language:     DCPU-16 Assembler (Notch's virtual CPU, http://0x10c.com)
" Maintainer:   Pavan Kumar Sunkara <pavan.sss1991@gmail.com>
" Last Change:  May 1st, 2012
" URL:          http://github.com/pksunkara/vim-dasm
" Revision:     1
" {{{1

" Syntax setup {{{2
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'dasm'
endif

" Syntax: Keywords {{{2
syn case match
syn keyword dasmTodo NOTE TODO FIXME XXX contained
syn case ignore

" Syntax: Labels {{{2
syn match dasmLabel      "^:[A-Z_][A-Z0-9_]*"
syn match dasmSubLabel   "^:\.[A-Z_][A-Z0-9_]*"

" any valid identifier
syn match dasmIdentifier "[a-z_][a-z0-9_]*"

" Syntax: Numbers {{{2
" octal {{{3
syn match dasmNumber     "\<0[0-7]*\>"
syn match dasmNumber     "\<[0-7]\+[oO]\>"
" decimal
syn match dasmNumber     "\<[1-9][0-9]*\>"
" hexadecimal {{{3
syn match dasmNumber     "\<0[Xx][0-9a-fA-F]\+\>"
syn match dasmNumber     "\<[0-9][0-9a-fA-F]*[Hh]\>"
syn match dasmNumber     "\$[0-9a-fA-F]\+\>"
" binary {{{3
syn match dasmNumber     "\<0[Bb][01]\+\>"
syn match dasmNumber     "\<[0-1]\+[bB]\>"

" Syntax: Strings {{{2
syn region dasmString    start=+"+ end=+"+

" one character
syn match dasmASCII      "'.'"

" Syntax: Comments {{{2
syn match dasmComment    ";.*" contains=dasmTodo
syn region dasmComment   start="/\*" end="\*/"

" Syntax: Registers {{{2
syn keyword dasmRegister a b c x y z i j sp pc ex ia pop peek push pick

" Syntax: Opcodes {{{2
syn keyword dasmOpcode  set add sub mul mli div dvi mod mdi and bor xor
syn keyword dasmOpcode  shr asr shl ifb ifc ife ifn ifg ifa ifl ifu
syn keyword dasmOpcode  adx sbx sti std

syn keyword dasmOpcode  jsr int iag ias rfi iaq hwn hwq hwi

" Syntax: Directive {{{2
syn keyword dasmDirective       word

" Define the default highlighting. {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dasm_syntax_inits")
  if version < 508
    let did_dasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink dasmTodo               Todo
  HiLink dasmComment            Comment

  HiLink dasmLabel              Function
  HiLink dasmSubLabel           Label

  HiLink dasmIdentifier         Function

  HiLink dasmString             String
  HiLink dasmASCII              Character

  HiLink dasmNumber             Number

  HiLink dasmOpcode             Statement
  HiLink dasmRegister           Type
  HiLink dasmDirective          PreProc

  delcommand HiLink
endif

let b:current_syntax = "dasm"
if main_syntax == 'dasm'
  unlet main_syntax
endif

" Vim settings {{{2
" vim: ts=8 fdm=marker
