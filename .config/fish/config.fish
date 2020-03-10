if test -n "$EMACS"
    set -x TERM eterm-color
    echo "Emacs"
end

# Setup coursier

set -g COURSIER_CACHE ~/.coursier-cache

if status is-interactive
    tmux
    clear
end
function fish_title
    true
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
if status --is-interactive
    set -g fish_user_abbreviations

    # Audible to mp3
    abbr -a audible 'bash AAXtoMP3 --single 9bb94d07'

    # Pass
    abbr -a pgp     'pass git push'
    abbr -a p       'pass'

    # Git
    abbr -a g       'git'
    abbr -a gs      'git status' # Conflicts with ghostscript
    abbr -a gcl     'git clone --recursive'
    abbr -a gclc    'git clone --recursive (xclip -selection c -out)'
    abbr -a ga      'git add'
    abbr -a gr      'git rebase'
    abbr -a grm     'git rebase origin/master'
    abbr -a grc     'git rebase --continue'
    abbr -a gra     'git rebase --abort'
    abbr -a gri     'git rebase --interactive'
    abbr -a grim    'git rebase --interactive origin/master'
    abbr -a gc      'git commit'
    abbr -a gcm     'git commit -m'
    abbr -a gcm     'git commit -m'
    abbr -a gco     'git checkout'
    abbr -a gcom    'git checkout master'
    abbr -a gcb     'git checkout -b'
    abbr -a grc     'git rm --cached'
    abbr -a grmb    'git branch -d'
    abbr -a gf      'git fetch --all'
    abbr -a gm      'git merge'
    abbr -a gmm     'git merge master'
    abbr -a gmom    'git fetch origin master; and git merge origin/master'
    abbr -a gp      'git push'
    abbr -a gpu     'git push -u origin (git rev-parse --abbrev-ref HEAD)'
    abbr -a gpf     'git push -f'
    abbr -a gpl     'git pull'
    abbr -a gpr     'git pull -r'
    abbr -a gb      'git branch --verbose'
    abbr -a gba     'git branch --verbose --all'
    abbr -a gl      'git lol'
    abbr -a gclean  'git checkout master; git pull; git branch --merged | grep -v "master" | grep -v \'^*\' | xargs git branch -d;'
    abbr -a grbom   'git fetch origin master; and git rebase origin/master'

    # Dotfile manager (git bare)
    abbr -a da      'dotfiles add'
    abbr -a dp      'dotfiles push'
    abbr -a dcm     'dotfiles commit -m'
    abbr -a ds      'dotfiles status'

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

    abbr -a sshno   'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

    abbr -a pw      'diceware -n9 ~/MyCloud/Documents/diceware_english.txt'
end

eval (ssh-agent -c)
