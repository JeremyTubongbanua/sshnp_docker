#/bin/bash
docker build -t sshnp .
docker container prune -f
docker stop sshnp
docker container rm sshnp
docker run -it --name sshnp sshnp