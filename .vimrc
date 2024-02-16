" puke7's vim lurv

" how you like it?
set tabstop=3
set shiftwidth=3
set autoindent
set ruler
set ff=unix

" colours
syntax enable
set background=dark
let g:gruvbox_termcolors=256
let g:solarized_termcolors=256
colorscheme gruvblast

" :e bash style tab completion
set wildmode=longest:full,full

" gvim cheats 4 copypasta
nnoremap <C-A> ggVG
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" format some JSON
command Fjson execute "%!python -m json.tool"

function! CommandLineSubstitute()
	let cl = getcmdline()
	if exists('g:command_line_substitutes')
		for [k, v] in g:command_line_substitutes
			if match(cl, k) == 0
				let cl = substitute(cl, k, v, "")
				break
			endif
		endfor
	endif
	return cl
endfunction

" This function reads search/replace pairs from a global variable you set
" in your `.vimrc`.  That global variable looks something like this:

" note that line continuation is only possible without 'C' in 'cpoptions'
let g:command_line_substitutes = [
	\ ['^vres ', 'vertical res '],
	\ ['^h ', 'vertical help '],
\]

" The last thing we need to do is a single map to call this function
" whenever we press `<enter>` on the command line:

cnoremap <enter> <c-\>eCommandLineSubstitute()<enter><enter>
