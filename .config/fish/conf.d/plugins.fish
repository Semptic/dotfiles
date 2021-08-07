# Install automatically
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'danhper/fish-ssh-agent'

fundle init
