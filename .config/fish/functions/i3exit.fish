function i3exit
  switch $argv
      case lock
          i3lock
      case logout
          i3-msg exit
      case suspend
          lock; and systemctl hybrid-sleep
      case hibernate
          lock; and systemctl hibernate
      case reboot
          systemctl reboot
      case shutdown
          systemctl poweroff
      case '*'
          echo "Usage: $0 {lock|saver|logout|suspend|hibernate|reboot|shutdown}"
          exit 2
  end
end

