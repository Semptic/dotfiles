function lock
    set IMG_PATH "$HOME/MyCloud/Photos/EarthPorn/"
    set IMG (find $IMG_PATH -maxdepth 1 -type f -not -name "*.sh" | shuf -n 1)
    trap revert_dpms HUP INT TERM
    xset dpms 1800 1800 1800 
    xset +dpms 
    eval $HOME/.config/i3/scripts/i3lock-multimonitor/lock -i "$IMG" -a "-n"
    revert_dpms
end

function revert_dpms
    xset dpms 0 0 0
end

function i3exit
  switch $argv
      case lock
          lock
      case logout
          i3-msg exit
      case suspend
          fish -c 'i3exit lock' &
          sleep 1
          systemctl hybrid-sleep
      case hibernate
          fish -c 'i3exit lock' &
          sleep 1
          systemctl hibernate
      case reboot
          systemctl reboot
      case shutdown
          systemctl poweroff
      case '*'
          echo "Usage: $0 {lock|saver|logout|suspend|hibernate|reboot|shutdown}"
          exit 2
  end
end

