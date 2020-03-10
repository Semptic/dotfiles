set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

source ~/.vim/plugins.vim    " load all plugins

call vundle#end()
filetype plugin indent on    " required

source ~/.vim/plugins_config.vim

