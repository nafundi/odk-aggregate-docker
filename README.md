# odk-aggregate
ODK Aggregate installation tools


# Usage
* make digitalocean  - make digitalocean image (provide your API TOKEN first)
* make box           - make vagrant box (with virtualbox)
* make mariadb       - start docker container with mariadb
* make tomcat        - start docker container with tomcat


# TODO
* TLS certs
* Packer for Google, AWS
* Cleanup Dockerfiles, docker_entrypoint.sh


# INFO
* Bug in odk installer in cmd mode - missed database hostname in config
* odk installer doesn't work without glibc

