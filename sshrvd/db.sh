#/bin/bash
docker build -t sshrvd .
docker container prune -f
docker stop sshrvd
docker container rm sshrvd
docker run -it --name sshrvd sshrvd