# Set gruvbox colors
set -l GRUVBOX_SCRIPT ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
    bash $GRUVBOX_SCRIPT
end

# Setup bobthefish theme
set -g theme_display_vi yes
set -g theme_display_cmd_duration no
set -g theme_display_date no
set -g theme_display_git yes

set -g theme_color_scheme gruvbox

set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes

set -g theme_display_hostname no
set -g theme_display_user no

# Set default editor
set -x EDITOR 'vim -f'


# Set local bin paths
set fish_user_paths $fish_user_paths $HOME/.local/bin
set fish_user_paths $fish_user_paths $HOME/.pyenv/bin

# Setup fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Setup abbrs
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
    abbr -a grmb    'git branch -d'
    abbr -a gf      'git fetch --all'
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
    abbr -a u      'yaourt -Syu --aur'
    abbr -a i      'yaourt -Sy'
    abbr -a r      'yaourt -Rs'

    # Vim
    abbr -a v       'vim'

    # sudo
    abbr -a s       'sudo'
    abbr -a se      'sudoedit'
end

# Always start tmux
test $TERM != "screen-256color"; and exec tmux

