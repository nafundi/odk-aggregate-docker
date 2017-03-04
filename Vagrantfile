# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.groups = {
      "odk" => ["demo"],
      "all:children" => ["odk"]
    }
  end

  config.vm.define "odk" do |odk|
    odk.vm.box = "debian/jessie64"
    odk.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: "tcp", auto_correct: true
    odk.vm.network "forwarded_port", guest: 8443, host: 8443, protocol: "tcp", auto_correct: true
    odk.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.name = "odk"
      v.linked_clone = true
      end
    end

end
