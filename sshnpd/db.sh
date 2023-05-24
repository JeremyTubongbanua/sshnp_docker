#/bin/bash
docker build -t sshnpd .
docker container prune -f
docker stop sshnpd 
docker container rm sshnpd
docker run -it --name sshnpd sshnpd