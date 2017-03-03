
.PHONY: up mariadb tomcat clean galaxy digitalocean box

up:
	vagrant up

mariadb:
	docker-compose up mariadb

tomcat:
	docker-compose up tomcat

clean:
	docker-compose rm --force

galaxy:
	ansible-galaxy install -f -r ./requirements.yml

digitalocean:
	packer build -only=digitalocean ./template.json

box:
	packer build -only=virtualbox-iso ./debian.json
