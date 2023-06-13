tmux new -d -s "sshnpd" ; tmux send-keys -t sshnpd "~/.local/bin/sshnpd -a @smoothalligator -m @jeremy_0 -d docker -s -u -v" C-m ; tmux a

~/.local/bin/sshnpd -a @smoothalligator -m @jeremy_0 -d docker -s -u -v