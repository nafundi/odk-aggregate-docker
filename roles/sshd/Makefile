.PHONY: run ansible_config pull detach syntax_check test_role test_idempotency docker host_syntax_check host_test-role host_test_idempotency host 

#Variable to be set to a value only if it's not already set
IMAGE ?= smartbrood/ubuntu-base
INIT ?= /bin/systemd

#Func and simply expanded variables
CONTAINER_ID := $(shell mktemp)
ROLE := $(shell basename ${PWD})

run:
	docker run --rm -it --volume=${PWD}:/etc/ansible/roles/${ROLE} smartbrood/ubuntu-base

ansible_config:
	printf '[defaults]\nroles_path=../\n[privilege_escalation]\nbecome=True\nbecome_method=sudo\nbecome_user=root' > ./ansible.cfg

pull:
	docker pull ${IMAGE}

detach: pull
	docker run --entrypoint="${INIT}" --detach --volume=${PWD}:/etc/ansible/roles/${ROLE} ${IMAGE} > ${CONTAINER_ID}
	
syntax_check: detach ansible_config
	docker exec --tty "`cat ${CONTAINER_ID}`" env TERM=xterm ansible-playbook /etc/ansible/roles/${ROLE}/tests/test.yml --syntax-check

test_role: syntax_check
	docker exec --tty "`cat ${CONTAINER_ID}`" env TERM=xterm ansible-playbook /etc/ansible/roles/${ROLE}/tests/test.yml

test_idempotency: test_role
	docker exec --tty "`cat ${CONTAINER_ID}`" env TERM=xterm ansible-playbook /etc/ansible/roles/${ROLE}/tests/test.yml | tee /tmp/output.txt; grep -q 'changed=0.*failed=0' /tmp/output.txt \
		|| (echo "Exit status not 0" && exit 1)

docker: test_idempotency
	docker stop "`cat ${CONTAINER_ID}`" \
	&& docker rm "`cat ${CONTAINER_ID}`" \
	&& rm -f ./ansible.cfg
	@echo "All fine."

host_syntax_check: ansible_config
	ansible-playbook ./tests/test.yml -i ./tests/inventory --syntax-check

host_test-role: host_syntax_check
	ansible-playbook ./tests/test.yml -i ./tests/inventory --connection=local

host_test_idempotency: host_test-role
	ansible-playbook ./tests/test.yml -i ./tests/inventory --connection=local \
		| tee /tmp/output.txt; grep -q 'changed=0.*failed=0' /tmp/output.txt \
		|| (echo "Exit status not 0" && exit 1)

host: host_test_idempotency
	rm -f ./ansible.cfg
	@echo "All fine."



