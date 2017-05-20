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

    abbr -a audible 'bash AAXtoMP3 --flac 9bb94d07'
end
