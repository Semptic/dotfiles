"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '|'
let g:indentLine_faster = 1 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fish
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up :make to use fish for syntax checking.
compiler fish

" Set this to have long lines wrap inside comments.
setlocal textwidth=79

" Enable folding of block structures in fish.
setlocal foldmethod=expr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-orgmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map for pdfpc
map <localleader>pb :OrgExportToBeamerPDF<cr>:!pdfpc %:r.pdf<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map for tagbar
nmap <F8> :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setConceal = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', "scala", "cpp", "c"]

