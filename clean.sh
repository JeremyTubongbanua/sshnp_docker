sudo docker stop jeremy_sshnp
sudo docker container rm jeremy_sshnp
sudo docker image rm jeremy_sshnp

sudo docker stop jeremy_sshnpd
sudo docker container rm jeremy_sshnpd
sudo docker image rm jeremy_sshnpd

sudo docker image rm jeremy_demo-base

sudo docker network rm jeremy_sshnp
sudo docker network rm jeremy_sshnpd

sudo docker container prune -f
sudo docker image prune -f
sudo docker network prune -f