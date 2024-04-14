if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
  tmux detach-client
else
  exec tmux popup -E "tmux new-session -A -s popup"
fi
