#!/bin/bash
sudo ssh-keygen -A
# ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "john@example.com"

tmux new -d -s "sshrvd" ; tmux send-keys -t sshrvd "~/.local/bin/sshrvd -a @tastelessbanana -i $(hostname -i) -v -s" C-m ; tmux a

~/.local/bin/sshrvd -a @tastelessbanana -i $(hostname -i) -v -s