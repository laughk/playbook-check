# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "minimal/trusty64"

  config.vm.define "zabbix_master" do |zabbix_master|
    zabbix_master.vm.network "private_network", ip: "192.168.33.10"
    zabbix_master.vm.network "forwarded_port", guest: 22, host: 2200
    zabbix_master.vm.network "forwarded_port", guest: 80, host: 8080
  end

  config.vm.define "app" do |app|
    app.vm.network "private_network", ip: "192.168.33.20"
    app.vm.network "forwarded_port", guest: 22, host: 22222
    app.vm.network "forwarded_port", guest: 80, host: 28080
  end


  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.inventory_path = "hosts.ini"
    ansible.limit = "all"
  end
end
