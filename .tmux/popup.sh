if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
  tmux detach-client
else
  exec tmux popup -E "tmux attach -t popup || tmux new -s popup"
fi
