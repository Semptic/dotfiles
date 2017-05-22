# test $TERM != "screen-256color"; and exec tmux

# set fish_function_path $fish_function_path "/run/current-system/sw/lib/python3.5/site-packages/powerline/bindings/fish/"

# powerline-setup

set -x EDITOR 'vim -f'

set fish_user_paths $fish_user_paths $HOME/.local/bin
set fish_user_paths $fish_user_paths $HOME/.pyenv/bin

# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)

if not set -q abbrs_initialized
    set -U abbrs_initialized

    # Audible to mp3
    abbr -a audible 'bash AAXtoMP3 --single 9bb94d07'

    # Pass
    abbr -a pgp     'pass git push'
    abbr -a p       'pass'

    # Git
    abbr -a g       'git'
    abbr -a gs      'git status'
    abbr -a gc      'git clone --recursive'
    abbr -a ga      'git add'
    abbr -a gch     'git checkout'
    abbr -a gcb     'git checkout -b'
    abbr -a grc     'git rm --cached'
    abbr -a gf      'git fetch --all'
    abbr -a gm      'git merge'
    abbr -a gp      'git push'

    # Vim
    abbr -a v       'vim'

    # docker
    abbr -a d       'docker'
    abbr -a dc      'docker-compose'
end
