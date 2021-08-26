if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -c' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -c > $HOME/.ssh/environment
   fi
   eval $(cat $HOME/.ssh/environment)
fi

# Source bashrc too
[[ -f ~/.bashrc ]] && . ~/.bashrc
