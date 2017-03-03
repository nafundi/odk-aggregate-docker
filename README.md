# odk-aggregate
ODK Aggregate installation tools


# Usage
* make digitalocean  - make digitalocean image (edit digitalocean_api_token in ./template.json)
* make aws           - make AWS AMI (edit aws_access_key and aws_secret_key in ./template.json)
* make box           - make vagrant box (with virtualbox)
* make up            - start and provision virtualbox vm with vagrant 
* make mariadb       - start docker container with mariadb
* make tomcat        - start docker container with tomcat


# Setup domain name
* Default domain name: "example.org".
* Port: 8080.
* Access to ODK Aggregate: http://example.org:8080  (Write "127.0.0.1 example.org" in /etc/hosts) 
* Setup your domain name in "./roles/odk/defaults/main.yml"  => "odk_vhost: example.org"


# Requirements
* Packer and Vagrant by HashiCorp
* Virtualbox
* Ansible
* Docker and Docker-compose
* Make


# DigitalOcean
* Edit digitalocean_api_token in ./template.json


# AWS
* Edit aws_access_key and aws_secret_key in ./template.json


# TODO
* TLS certs
* Packer for Google, AWS
* Cleanup Dockerfiles, docker_entrypoint.sh


# INFO
* Bug in odk installer in cmd mode - missed database hostname in config
* odk installer doesn't work without glibc

