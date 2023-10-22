# osTickets

yum install nano wget epel-release -y

yum install git yum-utils -y

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum update -y

yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

firewall-cmd --permanent --zone=public --add-port=80/tcp --add-port=3306/tcp

firewall-cmd --reload

cd /

mkdir osticket

cd osticket

git clone https://github.com/MAXPOL/osTickets.git

cd osTickets

docker build -t osticket .

docker run -d --name osticket -p 80:80 -ti osticket /bin/bash

docker ps

docker exec osticket service apache2 start

http://ip_address:80/


