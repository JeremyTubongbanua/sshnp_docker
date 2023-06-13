sudo ssh-keygen -A ; ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "john@example.com"
$(~/.local/bin/sshnp -f @jeremy_0 -t @smoothalligator -d docker -h @rv_am -s id_ed25519.pub)

Or 

~/.local/bin/sshnp -f @jeremy_0 -t @smoothalligator -d docker -h @rv_am -s id_ed25519.pub -v
~/.local/bin/sshnp -f @jeremy_0 -t @smoothalligator -d docker -h @tastelessbanana -s id_ed25519.pub -v
