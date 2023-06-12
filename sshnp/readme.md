Version : 3.1.2
-k, --key-file             Sending atSign's atKeys file if not in ~/.atsign/keys/
-f, --from (mandatory)     Sending atSign
-t, --to (mandatory)       Send a notification to this atSign
-d, --device               Send a notification to this device
                           (defaults to "default")
-h, --host (mandatory)     atSign of sshrvd daemon or FQDN/IP address to connect back to 
-p, --port                 TCP port to connect back to (only required if --host specified a FQDN/IP)
                           (defaults to "22")
-l, --local-port           Reverse ssh port to listen on, on your local machine, by sshnp default finds a spare port
                           (defaults to "0")
-s, --ssh-public-key       Public key file from ~/.ssh to be appended to authorized_hosts on the remote device
                           (defaults to "false")
-o, --local-ssh-options    Add these commands to the local ssh command
-v, --[no-]verbose         More logging
-r, --[no-]rsa             Use RSA 4096 keys rather than the default ED25519 keys