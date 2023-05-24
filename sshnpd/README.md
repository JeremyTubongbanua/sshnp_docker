
`sshnpd` usage

```sh
-k, --keyFile                Sending atSign's keyFile if not in ~/.atsign/keys/
-a, --atsign (mandatory)     atSign of this device
-m, --manager (mandatory)    Managers atSign, that this device will accept triggers from
-d, --device                 Send a trigger to this device, allows multiple devices share an atSign
                             (defaults to "default")
-s, --[no-]sshpublickey      Update authorized_keys to include public key from sshnp
-u, --[no-]username          Send username to the manager to allow sshnp to display username in command line
-v, --[no-]verbose           More logging
```

`./sshnpd -a @66dear32 -m @the50 -d docker -s -u -v`
