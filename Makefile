
.PHONY: up mariadb tomcat clean galaxy do

mariadb:
	docker-compose up mariadb

tomcat:
	docker-compose up tomcat

clean:
	docker-compose rm --force

galaxy:
	ansible-galaxy install -f -r ./requirements.yml

do:
	packer build -only=digitalocean ./template.json
