
.PHONY: up mariadb tomcat clean galaxy mariadb-daemon tomcat-daemon

mariadb:
	docker-compose up mariadb

tomcat:
	docker-compose up tomcat

clean:
	docker-compose rm --force

galaxy:
	ansible-galaxy install -f -r ./requirements.yml

mariadb-daemon:
	docker-compose up -d mariadb

tomcat-daemon:
	docker-compose up -d tomcat
