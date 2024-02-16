" Vim syntax file
" Language:     DASM for 6502 Architecures
" Maintainer:   langel <knoxburry@gmail.com>
"               LoBlast LLC <loblastpro@gmail.com>

" skipping rules for version 5.x and lower
syn case ignore

syn match dasm_bin_number "%[0-1]\+\>"
syn match dasm_dec_number "\<\d\+\>"
syn match dasm_hex_number "\$[0-9a-fA-F]\+\>"
syn match dasm_hex_number "\<[0-9a-fA-F]\+h\>"
syn match dasm_modifier   "#"

syn match dasm_label      "[a-z_][a-z0-9_]*"
syn match dasm_sublabel   "\.[a-z][a-z0-9_]*"

syn match dasm_comment    ";.*"

syn keyword dasm_conditions
 \ ifconst ifnconst if else endif eif
syn keyword dasm_controls
 \ processor echo subroutine err list .force
syn keyword dasm_defines
 \ equ eqm set setstr =
syn keyword dasm_directives
 \ org rorg seg rend align
syn keyword dasm_generates
 \ repeat repend
syn keyword dasm_includes
 \ incbin incdir include
syn keyword dasm_macros
 \ mac macro endm mexit
syn keyword dasm_types
 \ byte hex dc ds dv res

syn keyword dasm_opcodes 
 \ adc and asl bcc bcs beq bit bmi bne bpl brk bvc bvs clc cld cli clv cmp cpx
 \ cpy dec dex dey eor inc inx iny jmp jsr lda ldx ldy lsr nop ora pha php pla
 \ plp rol ror rti rts sbc sec sed sei sta stx sty tax tay tsx txa txs tya
    

hi def link dasm_bin_number Number
hi def link dasm_dec_number Number
hi def link dasm_hex_number Number
hi def link dasm_modifier   Character
hi def link dasm_label      Label
hi def link dasm_sublabel   Label
hi def link dasm_comment    Comment
hi def link dasm_controls   Structure
hi def link dasm_conditions Conditional
hi def link dasm_defines    Define
hi def link dasm_directives PreProc
hi def link dasm_generates  Function
hi def link dasm_includes   Include
hi def link dasm_macros     Macro
hi def link dasm_types      Type
hi def link dasm_opcodes    Keyword


let b:current_syntax = "asm"
