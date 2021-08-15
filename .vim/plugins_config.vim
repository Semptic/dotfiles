"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME."/.vim/bundle/indentLine") 
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '|'
    let g:indentLine_faster = 1 
    let g:indentLine_setConceal = 0
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
" => gruvboc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME."/.vim/bundle/vim-airline") && isdirectory($HOME."/.vim/bundle/gruvbox")
    let g:airline_theme = 'gruvbox'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    
    " let g:gruvbox_italic=1
    let g:gruvbox_contrast_light = 'hard'
    let g:gruvbox_contrast_dark = 'hard'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME."/.vim/bundle/vim-markdown") 
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', "scala", "cpp", "c"]
endif
