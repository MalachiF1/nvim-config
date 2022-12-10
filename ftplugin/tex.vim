set syntax=on
set wrap
set linebreak

" PDF Viewer:
" http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_zathura_options = '-reuse-instance'
let g:vimtex_quickfix_mode = 2 
let g:vimtex_syntax_enabled = 1 
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" so syntax highlighting works properly
let g:tex_flavor = "latex"

set conceallevel=1
let g:tex_conceal = 'abdmg'

" Error Suppression:
" https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string',
      \ ]


" map <silent> <localleader>v <plug>(vimtex-view)
map <silent> <localleader>v :!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>

" when in enumerate environment map shift+Enter to make new line and prefix it
" with "\item"
call vimtex#imaps#add_map({
    \ 'lhs' : '<S-CR>',
    \ 'rhs' : '\item ',
    \ 'leader' : '',
    \ 'wrapper' : 'vimtex#imaps#wrap_environment',
    \ 'context' : ["itemize", "enumerate"],
    \})
