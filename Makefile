
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
	packer build -only=digitalocean -var-file=variables.json ./template.json

aws:
	packer build -only=amazon-ebs -var-file=variables.json ./template.json

google:
	packer build -only=googlecompute -var-file=variables.json ./template.json

box:
	packer build -only=virtualbox-iso -var-file=variables.json ./debian.json
