# Enable the fuck if installed
if type -q thefuck
    thefuck --alias | source
end

# Enable vi mode
fish_vi_key_bindings

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

function fish_title
    true
end

# Add to path
set -U fish_user_paths ~/.cargo/bin ~/.jenv/bin /usr/local/opt/grep/libexec/gnubin ~/.local/bin ~/.pyenv/bin /usr/local/sbin 

# Enable jenv
status --is-interactive; and source (jenv init -|psub)

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

# Setup fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Setup abbrs
if status --is-interactive
    set -g fish_user_abbreviations

    # Fuck
    abbr -a f fuck

    # Audible to mp3
    abbr -a audible 'bash AAXtoMP3 --single -A 9bb94d07'

    # Git
    abbr -a gs      'git status' # Conflicts with ghostscript
    abbr -a gcl     'git clone --recursive'
    abbr -a gclc    'git clone --recursive (xclip -selection c -out)'
    abbr -a ga      'git add'
    abbr -a grm     'git rebase origin/master'
    abbr -a gri     'git rebase --interactive HEAD~5'
    abbr -a grim    'git rebase --interactive origin/master'
    abbr -a gc      'git commit'
    abbr -a gcm     'git commit -m'
    abbr -a gco     'git checkout'
    abbr -a gcb     'git checkout -b'
    abbr -a grc     'git rm --cached'
    abbr -a gf      'git fetch --all'
    abbr -a gmm     'git merge master'
    abbr -a gp      'git push'
    abbr -a gpu     'git push -u origin (git rev-parse --abbrev-ref HEAD)'
    abbr -a gpf     'git push -f'
    abbr -a gpl     'git pull'
    abbr -a gpm     'git checkout master; and git pull'
    abbr -a gb      'git branch --verbose'
    abbr -a gba     'git branch --verbose --all'
    abbr -a gl      'git lol'
    abbr -a gclean  'git checkout master; git pull; git branch --merged | grep -v "master" | grep -v \'^*\' | xargs git branch -d;'
    abbr -a gt      'git commit --allow-empty -m "Trigger build"; git push'

    # Dotfile manager (git bare)
    abbr -a d       'dotfiles'
    abbr -a dpl     'dotfiles pull --prune'
    abbr -a ds      'dotfiles status'
    abbr -a da      'dotfiles add'
    abbr -a dp      'dotfiles push'
    abbr -a dcm     'dotfiles commit -m'

    # Arch
    abbr -a u      'yay -Syu --devel --timeupdate'
    abbr -a r      'yay -Rs'

    abbr -a sshno   'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
end

# Start ssh agent
setenv SSH_ENV $HOME/.ssh/environment
function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end
