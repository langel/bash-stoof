set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name='gey'

if &t_Co != 256
	finish
endif

hi Normal guifg=220 ctermfg=220
hi Comment guifg=201 ctermfg=201
hi Constant guifg=135 ctermfg=135
hi Special guifg=202 ctermfg=202
hi Identifier guifg=39 ctermfg=39
hi Statement guifg=208 ctermfg=208
hi PreProc guifg=27 ctermfg=27
hi Type guifg=40 ctermfg=40
hi Function guifg=226 ctermfg=226
hi Repeat guifg=46 ctermfg=46
hi Operator guifg=196 ctermfg=196
hi Ignore guifg=235 ctermfg=235
hi Error term=reverse guifg=15 guibg=88 ctermfg=15 ctermbg=88
hi Todo term=standout guifg=201 guibg=238 ctermfg=201 ctermbg=238


hi Visual guifg=7 guibg=235 ctermfg=7 ctermbg=235
hi VertSplit guibg=235 guifg=235 ctermbg=235 ctermfg=235
hi StatusLine guifg=235 guibg=7 ctermfg=235 ctermbg=7
hi StatusLineNC guifg=235 guibg=242 ctermfg=235 ctermbg=242 

hi Directory guifg=33 ctermfg=33

hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
