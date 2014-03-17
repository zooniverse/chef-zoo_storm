# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.box = "opscode_ubuntu-12.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"

  [:nimbus, :storm1, :storm2].each_with_index do |b,i|
    config.vm.define b do |c|
      c.vm.hostname = b.to_s
      c.hostmanager.aliases = "#{b}.zooniverse.local"
      c.vm.network :private_network, ip: "10.42.42.#{i + 5}"

      c.vm.provision :chef_solo do |chef|
        chef.run_list = [
            "recipe[zoo-storm::vagrant]"
        ]
      end
    end
  end
end
