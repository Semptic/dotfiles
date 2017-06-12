# test $TERM != "screen-256color"; and exec tmux

# set fish_function_path $fish_function_path "/run/current-system/sw/lib/python3.5/site-packages/powerline/bindings/fish/"

# powerline-setup

set -x EDITOR 'vim -f'

set fish_user_paths $fish_user_paths $HOME/.local/bin
set fish_user_paths $fish_user_paths $HOME/.pyenv/bin

# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)

if not set -q __abbrs_initi
    set -U __abbrs_initi

    # Audible to mp3
    abbr -a audible 'bash AAXtoMP3 --single 9bb94d07'

    # Pass
    abbr -a pgp     'pass git push'
    abbr -a p       'pass'

    # Git
    abbr -a g       'git'
    abbr -a gs      'git status' # Conflicts with ghostscript
    abbr -a gcl     'git clone --recursive'
    abbr -a ga      'git add'
    abbr -a gc      'git commit'
    abbr -a gcm     'git commit -m'
    abbr -a gco     'git checkout'
    abbr -a gcom    'git checkout master'
    abbr -a gcb     'git checkout -b'
    abbr -a gcf     'git checkout -b feature/'
    abbr -a grc     'git rm --cached'
    abbr -a gf      'git fetch --prune --all'
    abbr -a gm      'git merge'
    abbr -a gmm     'git merge master'
    abbr -a gmom    'git fetch origin master; and git merge origin/master'
    abbr -a gp      'git push'
    abbr -a gb      'git branch --verbose'
    abbr -a gba     'git branch --verbose --all'
    abbr -a gl      'git lol'

    # Dotfile manager (git bare)
    abbr -a da      'dot add'
    abbr -a dp      'dot push'
    abbr -a dcm     'dot commit -m'
    abbr -a ds      'dot status'

    # docker
    abbr -a d       'docker'
    abbr -a dc      'docker-compose'
    
    
    # Arch
    abbr -a pu      'pacaur -Syu'
    abbr -a pi      'pacaur -S'
    abbr -a pr      'pacaur -Rs'

    # Vim
    abbr -a v       'vim'

    # File edit
    abbr -a ei3     'vim ~/.config/i3/config'
    abbr -a egit     'vim ~/.gitconfig'
    abbr -a efish   'vim ~/.config/fish/config.fish'
    abbr -a evim    'vim ~/.vim/vimrc.vim ~/.vim/plugins.vim ~/.vim/plugins_config.vim ~/.vimrc'

    # sudo
    abbr -a s       'sudo'
    abbr -a se      'sudoedit'

    # ranger
    abbr -a r       'ranger'
end
