#! /bin/bash

sudo yum update -y

sudo amazon-linux-extras install docker
sudo systemctl start docker
sudo systemctl enable docker

cat << EOT > start-website
/bin/sh -e -c 'echo \$(aws ecr get-login-password --region ap-northeast-1) | docker login -u AWS --password-stdin ${repository_url}'
sudo docker pull ${repository_url}:release
sudo docker run -p 80:8000 ${repository_url}:release
EOT

sudo mv start-website /var/lib/cloud/scripts/per-boot/start-website
sudo chmod +x /var/lib/cloud/scripts/per-boot/start-website
/var/lib/cloud/scripts/per-boot/start-website