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
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gruvbox_italic=1
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'hard'

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

