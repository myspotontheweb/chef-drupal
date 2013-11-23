# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-chef-zero"
Vagrant.require_plugin "vagrant-berkshelf"

Vagrant.configure("2") do |config|

  config.vm.hostname = "drupal"

  # Box config
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  # network config
  config.vm.network :private_network, ip: "33.33.33.10"

  # Plugin config
  config.omnibus.chef_version = "11.4.0"
  config.berkshelf.enabled = true

  # Provisioning config
  config.vm.provision :chef_client do |chef|
    chef.add_recipe "drupal"
  end
end
