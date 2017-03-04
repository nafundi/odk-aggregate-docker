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
* Ports: 8080 and 8443
* Access to ODK Aggregate: http://example.org:8080  or https://example.org:8443 (Write "127.0.0.1 example.org" in /etc/hosts) 
* Setup your domain name in "./roles/odk/defaults/main.yml"  => "odk_vhost: example.org"


# Requirements
* Packer and Vagrant by HashiCorp
* Virtualbox
* Ansible
* Docker and Docker-compose
* Make


# DigitalOcean
* Edit "digitalocean_api_token" in ./variables.json


# AWS
* Edit "aws_access_key" and "aws_secret_key" in ./variables.json


# Google Compute
* Edit "googlecompute_project_id" in ./variables.json
* Save google service account json to ./googlecompute_account.json or edit "googlecompute_account_file" in in ./variables.json


# TODO
* TLS certs
* Packer for Google, AWS
* Cleanup Dockerfiles, docker_entrypoint.sh


# INFO
* Bug in odk installer in cmd mode - missed database hostname in config
* odk installer doesn't work without glibc
* "HTTP/1.1 505 HTTP Version not supported" - got error periodically from amazon s3 when wget -O odk https://opendatakit.org/download/4456/ during docker image smartbrood/odk-tomcat build

